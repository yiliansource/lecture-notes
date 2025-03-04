import Link from "next/link";

export default function NotFound() {
    return (
        <div className="w-screen h-screen flex">
            <div className="m-auto text-center">
                <h1 className="mb-2 text-3xl font-bold">404</h1>
                <h3 className="mb-4">Diese Seite konnte nicht gefunden werden.</h3>
                <Link href="/" className="text-blue-600 hover:underline">
                    Zurück zur Startseite
                </Link>
            </div>
        </div>
    );
}
