import clsx from "clsx";
import { Geist } from "next/font/google";

import "./globals.css";

const geist = Geist({
    variable: "--font-geist",
    subsets: ["latin"],
});

export default function RootLayout({ children }: { children: React.ReactNode }) {
    return (
        <html lang="en">
            <head></head>
            <body
                className={clsx(...[geist].map((f) => f.variable), "font-[family-name:var(--font-geist)] antialiased")}
            >
                {children}
            </body>
        </html>
    );
}
