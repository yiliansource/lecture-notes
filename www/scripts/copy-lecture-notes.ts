import * as fs from "fs";
import * as path from "path";

const lecturesRoot = path.join(process.cwd(), "..", "lectures");
const lectureKeys = fs.readdirSync(lecturesRoot);

fs.mkdirSync(path.join(process.cwd(), "out", "documents"), { recursive: true });

for (const lectureKey of lectureKeys) {
    const lectureDirectory = path.join(process.cwd(), "..", "lectures", lectureKey);

    fs.copyFileSync(
        path.join(lectureDirectory, "document.pdf"),
        path.join(process.cwd(), "out", "documents", lectureKey + ".pdf"),
    );

    console.log(`Copied "${lectureKey}.pdf" to output.`);
}
