import { LectureMetadata, getLectures } from "@/lib/lectures";
import { Metadata } from "next";

export const metadata: Metadata = {
    title: "Vorlesungsmitschriften",
    description: "Eine Ansammlung an Vorlesungsmitschriften.",
};

export default async function Home() {
    const lectures = await getLectures();

    return (
        <div className="px-3 flex flex-col mx-auto w-full min-h-screen max-w-4xl">
            <header className="pt-12 lg:pt-16 pb-4 lg:pb-8 select-none">
                <h1 className="text-3xl lg:text-4xl font-bold">Vorlesungsmitschriften</h1>
                <p className="text-xl font-semibold">Ian Hornik</p>
            </header>
            <div className="grow flex flex-col divide-y divide-gray-200">
                {lectures.map((l) => (
                    <LectureItem {...l} key={l.id} />
                ))}
            </div>
            <footer className="py-4 lg:py-8 flex flex-col lg:flex-row justify-between select-none text-gray-500 ">
                <p>Eine Ansammlung an Vorlesungsmitschriften.</p>
                <p>Copyright &copy; {new Date().getFullYear()} Ian Hornik</p>
            </footer>
        </div>
    );
}

function LectureItem({ id, title, lecturer, semester, lastChanged }: LectureMetadata) {
    const lastChangedDate = new Date(lastChanged);

    return (
        <div className="py-4">
            <div className="flex flex-col">
                <div className="flex flex-row gap-3">
                    <span>
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
                {lecturer && (
                    <div>
                        <span className="text-sm">{lecturer}</span>
                    </div>
                )}
                <div>
                    <span className="text-sm text-gray-600">
                        Aktualisiert:{" "}
                        {new Intl.DateTimeFormat("de-DE", {
                            dateStyle: "full",
                        }).format(lastChangedDate)}
                    </span>
                </div>
            </div>
        </div>
    );
}
