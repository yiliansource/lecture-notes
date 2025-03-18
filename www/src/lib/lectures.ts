import { exec as execCallback } from "child_process";
import * as fs from "fs";
import { globSync } from "glob";
import * as path from "path";
import { promisify } from "util";
import { z } from "zod";

export interface LectureMetadata {
    id: string;
    title: string;
    lecturer: string | null;
    semester: string | null;
    lastChanged: number;
}

const metaJsonSchema = z.object({
    title: z.string(),
    lecturer: z.string().optional(),
    semester: z.string().optional(),
});

export const exec = promisify(execCallback);

export async function getLectures(): Promise<LectureMetadata[]> {
    const lectureNotes: LectureMetadata[] = [];

    const lectureNoteRoot = path.join(process.cwd(), "..", "lectures");

    for (const lectureNoteFolderName of fs.readdirSync(lectureNoteRoot)) {
        const lectureNoteFolder = path.join(lectureNoteRoot, lectureNoteFolderName);
        if (fs.existsSync(path.join(lectureNoteFolder, ".nobuild"))) continue;

        const lectureDocumentFile = path.join(lectureNoteFolder, "document.tex");
        const lectureDocument = fs.readFileSync(lectureDocumentFile, "utf-8");

        const lectureData = Object.fromEntries(
            ["title", "lecturer", "semester"].map((key) => [
                key,
                lectureDocument.match(new RegExp(`\\\\${key}\{(.*)\}`))?.[1] ?? null,
            ]),
        );

        const parseResult = metaJsonSchema.safeParse(lectureData);
        if (!parseResult.success) continue;

        const metadata = parseResult.data;
        const lectureDocumentStats = fs.lstatSync(lectureDocumentFile);

        const modifiedDates = (
            await Promise.all(
                globSync("./**/*.tex", { cwd: lectureNoteFolder })
                    .map((file) => path.join(lectureNoteFolder, file))
                    .map((path) => exec(`git log -1 --pretty="format:%ci" ${path}`)),
            )
        )
            .map((o) => (!o ? Number.NaN : new Date(o.stdout).getTime()))
            .filter((n) => !Number.isNaN(n));
        const lastModifiedTime =
            modifiedDates.length > 0 ? Math.max(...modifiedDates) : lectureDocumentStats.mtime.getTime();

        lectureNotes.push({
            id: lectureNoteFolderName,
            title: metadata.title,
            lecturer: metadata.lecturer ?? null,
            semester: metadata.semester ?? null,
            lastChanged: lastModifiedTime,
        });
    }

    lectureNotes.sort((a, b) => b.lastChanged - a.lastChanged);

    return lectureNotes;
}
