import * as fs from "node:fs/promises";
import * as path from "node:path";
import * as z from "zod";

const repositoryRoot = path.resolve(import.meta.dirname, "..", "..");
const lecturesRoot = path.join(repositoryRoot, "lectures");
const pdfsRoot = path.join(repositoryRoot, "www", "public", "documents");
const generatedRoot = path.resolve(repositoryRoot, "www", "src", "generated");

await fs.rm(pdfsRoot, { recursive: true, force: true }); // clear old pdfs
await fs.mkdir(pdfsRoot, { recursive: true });
await fs.mkdir(generatedRoot, { recursive: true });

const LectureManifest = z.object({
	title: z.string().min(3).max(128),
	lecturer: z.string(),
	semester: z.string().regex(/\d{4}[WS]/),
});

type LectureManifest = z.infer<typeof LectureManifest>;

interface LectureMetadata extends LectureManifest {
	id: string;
	lastChanged: number;
}

const lectures: LectureMetadata[] = [];
for (const lectureDirname of await fs.readdir(lecturesRoot)) {
	const lectureId = lectureDirname;
	const lectureDir = path.join(lecturesRoot, lectureDirname);
	if (await fs.exists(path.join(lectureDir, ".nopublish"))) continue;

	const lectureManifestPath = path.join(lectureDir, "manifest.json");
	if (!(await fs.exists(lectureManifestPath))) {
		console.error(`No lecture manifest found for lecture '${lectureId}'.`);
		continue;
	}
	const lectureManifestContents = await fs.readFile(
		lectureManifestPath,
		"utf-8",
	);
	const lectureManifest = await LectureManifest.safeParseAsync(
		JSON.parse(lectureManifestContents),
	);
	if (!lectureManifest.success) {
		console.error(`Malformed lecture manifest for lecture '${lectureId}'.`);
		console.log(z.treeifyError(lectureManifest.error));
		continue;
	}

	const lectureDirFiles = await fs.readdir(lectureDir);
	const lecturePdfName = lectureDirFiles.find((f) => f.endsWith(".pdf"));
	if (lecturePdfName === undefined) {
		console.error(`No lecture .pdf found for lecture '${lectureId}'.`);
		continue;
	}

	const lecturePdfPath = path.join(lectureDir, lecturePdfName);
	fs.copyFile(lecturePdfPath, path.join(pdfsRoot, `${lectureId}.pdf`));

	// TODO: this does not work correctly
	const lecturePdfModifiedDateString =
		await Bun.$`git log -1 --format=%aI -- ${lecturePdfPath}`.text();
	const lecturePdfModifiedDate = lecturePdfModifiedDateString
		? new Date(lecturePdfModifiedDateString.trim())
		: (await fs.stat(lecturePdfPath)).mtime;

	lectures.push({
		id: lectureId,
		title: lectureManifest.data.title ?? lectureId,
		lecturer: lectureManifest.data.lecturer,
		semester: lectureManifest.data.semester,
		lastChanged: lecturePdfModifiedDate.getTime(),
	});

	console.log(`✓ ${lectureId}`);
}
lectures.sort((a, b) => b.semester.localeCompare(a.semester));

const output = `// This file is generated. Do not edit manually.

export const lectures = ${JSON.stringify(lectures, null, 4)} as const;

export type LectureMetadata = (typeof lectures)[number];
`;

fs.writeFile(path.join(generatedRoot, "lectures.ts"), output);
