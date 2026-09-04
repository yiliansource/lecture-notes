import * as fs from "node:fs/promises";
import * as path from "node:path";

const repositoryRoot = path.resolve(import.meta.dirname, "..", "..");
const lecturesRoot = path.join(repositoryRoot, "lectures");
const pdfsRoot = path.join(repositoryRoot, "www", "public", "documents");
const generatedRoot = path.resolve(repositoryRoot, "www", "src", "generated");

await fs.rm(pdfsRoot, { recursive: true, force: true });
await fs.mkdir(pdfsRoot, { recursive: true });
await fs.mkdir(generatedRoot, { recursive: true });

interface LectureMetadata {
	id: string;
	title: string;
	lecturer: string | null;
	semester: string | null;
	lastChanged: number;
}

const lectures: LectureMetadata[] = [];
for (const lectureDirname of await fs.readdir(lecturesRoot)) {
	const lectureDir = path.join(lecturesRoot, lectureDirname);
	if (await fs.exists(path.join(lectureDir, ".nopublish"))) continue;

	const lectureDocumentPath = path.join(lectureDir, "document.tex");
	const lectureDocumentContent = await fs.readFile(
		lectureDocumentPath,
		"utf-8",
	);

	const lectureId = lectureDirname;
	const lectureData = Object.fromEntries(
		["title", "lecturer", "semester"].map((key) => [
			key,
			lectureDocumentContent.match(new RegExp(`\\\\${key}{(.*)}`))?.[1] ??
				null,
		]),
	);

	const lecturePdfPath = path.join(lectureDir, "document.pdf");
	const lecturePdfModifiedDateString =
		await Bun.$`git log -1 --format=%aI -- ${lecturePdfPath}`.text();
	const lecturePdfModifiedDate = lecturePdfModifiedDateString
		? new Date(lecturePdfModifiedDateString.trim())
		: (await fs.stat(lecturePdfPath)).mtime;

	lectures.push({
		id: lectureId,
		title: lectureData.title ?? lectureDirname,
		lecturer: lectureData.lecturer ?? null,
		semester: lectureData.semester ?? null,
		lastChanged: lecturePdfModifiedDate.getTime(),
	});

	fs.copyFile(lecturePdfPath, path.join(pdfsRoot, `${lectureId}.pdf`));

	console.log(`✓ ${lectureId}`);
}
lectures.sort((a, b) => b.lastChanged - a.lastChanged);

const output = `// This file is generated. Do not edit manually.

export const lectures = ${JSON.stringify(lectures, null, 4)} as const;

export type LectureMetadata = (typeof lectures)[number];
`;

fs.writeFile(path.join(generatedRoot, "lectures.ts"), output);
