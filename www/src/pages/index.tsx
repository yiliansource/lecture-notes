import { exec } from "@/lib/cmd";
import * as fs from "fs";
import { globSync } from "glob";
import type { GetStaticProps, InferGetStaticPropsType } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import * as path from "path";
import { z } from "zod";

const geistSans = Geist({
    variable: "--font-geist-sans",
    subsets: ["latin"],
});

const geistMono = Geist_Mono({
    variable: "--font-geist-mono",
    subsets: ["latin"],
});

interface LectureNotesMetadata {
    id: string;
    title: string;
    lecturer: string | null;
    semester: string | null;
    lastChanged: number;
}

const metaSchema = z.object({
    title: z.string(),
    lecturer: z.string().optional(),
    semester: z.string().optional(),
});

export const getStaticProps: GetStaticProps<{
    lectureNotes: LectureNotesMetadata[];
}> = async () => {
    const lectureNotes: LectureNotesMetadata[] = [];

    const lectureNoteRoot = path.join(process.cwd(), "..", "lectures");

    for (const lectureNoteFolderName of fs.readdirSync(lectureNoteRoot)) {
        const lectureNoteFolder = path.join(lectureNoteRoot, lectureNoteFolderName);
        const metaFilePath = path.join(lectureNoteFolder, "meta.json");
        if (!fs.existsSync(metaFilePath)) continue;

        const metaFileStats = fs.lstatSync(metaFilePath);
        const metaFileContents = fs.readFileSync(metaFilePath, "utf-8");
        const parseResult = metaSchema.safeParse(JSON.parse(metaFileContents));
        if (!parseResult.success) continue;

        const metadata = parseResult.data;

        const modifiedDates = (
            await Promise.all(
                globSync("./**/*.tex", { cwd: lectureNoteFolder })
                    .map((file) => path.join(lectureNoteFolder, file))
                    .map((path) => exec(`git log -1 --pretty="format:%ci" ${path}`)),
            )
        )
            .map((o) => (!o ? Number.NaN : new Date(o.stdout).getTime()))
            .filter((n) => !Number.isNaN(n));
        const lastModifiedTime = modifiedDates.length > 0 ? Math.max(...modifiedDates) : metaFileStats.mtime.getTime();

        lectureNotes.push({
            id: lectureNoteFolderName,
            title: metadata.title,
            lecturer: metadata.lecturer ?? null,
            semester: metadata.semester ?? null,
            lastChanged: lastModifiedTime,
        });
    }

    lectureNotes.sort((a, b) => b.lastChanged - a.lastChanged);

    return {
        props: {
            lectureNotes,
        },
    };
};

export default function Home({ lectureNotes }: InferGetStaticPropsType<typeof getStaticProps>) {
    return (
        <div className={`${geistSans.variable} ${geistMono.variable} font-[family-name:var(--font-geist-sans)]`}>
            <div className="flex flex-col">
                {lectureNotes.map((l) => (
                    <LectureNotesItem {...l} key={l.id} />
                ))}
            </div>
        </div>
    );
}

function LectureNotesItem({ id, title, lecturer, semester, lastChanged }: LectureNotesMetadata) {
    const lastChangedDate = new Date(lastChanged);

    return (
        <div className="mb-2">
            <p className="text-xl">
                <a href={"/documents/" + id + ".pdf"} target="_blank">
                    {title}
                </a>
            </p>
            <p>{lecturer}</p>
            <p>{semester}</p>
            <p>
                {lastChangedDate.getDate()}.{lastChangedDate.getMonth() + 1}.{lastChangedDate.getFullYear()}
            </p>
        </div>
    );
}
