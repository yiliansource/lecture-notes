import { LectureMetadata, getLectures } from "@/lib/lectures";
import { format } from "date-fns";
import { deAT } from "date-fns/locale";
import { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { FaGithub, FaGraduationCap, FaRegClock } from "react-icons/fa";

export const metadata: Metadata = {
    title: "Vorlesungsmitschriften",
    description: "Eine Ansammlung an Vorlesungsmitschriften.",
};

export default async function Home() {
    const lectures = await getLectures();

    return (
        <div className="px-3 flex flex-col mx-auto w-full min-h-screen max-w-4xl">
            <header className="pt-12 lg:pt-16 pb-4 lg:pb-8 select-none">
                <h1 className="mb-1 text-2xl lg:text-4xl font-bold">Vorlesungsmitschriften</h1>
                <p className="text-base lg:text-lg flex flex-row items-center gap-2 text-neutral-500">
                    <span className="w-[28px] aspect-square inline-block rounded-full overflow-hidden">
                        <Image
                            src="/avatar.png"
                            width={32}
                            height={32}
                            alt="Avatar"
                            className="scale-125"
                            draggable={false}
                        />
                    </span>
                    <span>Ian Hornik</span>
                </p>
            </header>
            <div className="grow flex flex-col divide-y divide-gray-200">
                {lectures.map((l) => (
                    <LectureItem {...l} key={l.id} />
                ))}
            </div>
            <footer className="py-3 lg:py-6 flex flex-col select-none text-neutral-500 ">
                <p className="mb-1">Eine Ansammlung an Vorlesungsmitschriften.</p>
                <div className="flex flex-row justify-between items-center text-sm text-neutral-400">
                    <p>&copy; {new Date().getFullYear()} Ian Hornik</p>
                    <p className="text-xl hover:text-neutral-600">
                        <Link href="https://github.com/yiliansource/lecture-notes" target="_blank">
                            <FaGithub />
                        </Link>
                    </p>
                </div>
            </footer>
        </div>
    );
}

function LectureItem({ id, title, lecturer, semester, lastChanged }: LectureMetadata) {
    return (
        <div className="py-4 select-none">
            <div className="flex flex-col">
                <div className="mb-1 flex flex-row gap-3">
                    <span className="font-semibold">
                        <a className="hover:underline" href={"/documents/" + id + ".pdf"} target="_blank">
                            {title}
                        </a>
                    </span>
                    {semester && (
                        <span className="inline-flex items-center px-2 py-1 text-xs font-medium text-blue-700 bg-blue-50 ring-1 ring-inset ring-blue-700/10 rounded-md">
                            {semester}
                        </span>
                    )}
                </div>
                <div className="flex flex-col lg:flex-row gap-1 lg:gap-5 text-neutral-500 text-sm">
                    {lecturer && (
                        <div className="flex flex-row items-center gap-1">
                            <span className="text-base">
                                <FaGraduationCap />
                            </span>
                            <span>{lecturer}</span>
                        </div>
                    )}
                    <div className="flex flex-row items-center gap-1">
                        <span className="text-sm">
                            <FaRegClock />
                        </span>
                        <span>
                            {format(lastChanged, "eeee, do MMMM yyyy, HH:mm", {
                                locale: deAT,
                            })}
                        </span>
                    </div>
                </div>
            </div>
        </div>
    );
}
