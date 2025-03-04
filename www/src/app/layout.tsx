import clsx from "clsx";
import { Geist } from "next/font/google";

import "./globals.css";

const geistSans = Geist({
    variable: "--font-geist-sans",
    subsets: ["latin"],
});

export default function RootLayout({ children }: { children: React.ReactNode }) {
    return (
        <html lang="en">
            <head></head>
            <body className={clsx(geistSans.variable, "font-[family-name:var(--font-geist-sans)] antialiased")}>
                {children}
            </body>
        </html>
    );
}
