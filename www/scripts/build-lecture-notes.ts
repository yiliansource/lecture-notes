// TODO: This script is broken. It works locally, but on GitHub Actions the
// build command always fails without a good error description.
import { execSync } from "child_process";
import * as fs from "fs";
import { globSync } from "glob";
import * as path from "path";

const lastCommitOutput = execSync("git show --name-status HEAD --oneline", { encoding: "utf-8" }).trimEnd();
const lastCommitOutputLines = lastCommitOutput.split("\n");

// const commitInfoParts = lastCommitOutputLines[0].split(" ");
// const commitHash = commitInfoParts[0];
// const commitMessage = commitInfoParts.slice(1).join(" ");

const fileInformations = lastCommitOutputLines.slice(1).map((l) => l.split("\t"));
const targetLectureNotes = new Set(
    fileInformations
        .filter(([, file]) => file.startsWith("lectures/"))
        .filter(([type]) => type === "A" || type === "M")
        .map(([, file]) => file.split("/")[1]),
);

console.log(fileInformations);

fs.mkdirSync(path.join(process.cwd(), "out", "documents"), { recursive: true });

for (const targetName of targetLectureNotes) {
    try {
        const directory = path.join(process.cwd(), "..", "lectures", targetName);

        const cleanTargets = globSync("*.{aux,fdb_latexmk,fls,log,out,pdf,toc,synctex.gz}", { cwd: directory }).map(
            (file) => path.join(directory, file),
        );
        for (const cleanTarget of cleanTargets) {
            fs.rmSync(cleanTarget);
        }

        console.log(`Building "${targetName}" ...`);

        execSync(
            `pdflatex -interaction=nonstopmode -output-directory "${directory}" "${path.join(directory, "document.tex")}"`,
        );

        console.log(`Finished building "${targetName}".`);

        fs.copyFileSync(
            path.join(directory, "document.pdf"),
            path.join(process.cwd(), "out", "documents", targetName + ".pdf"),
        );

        console.log(`Copied "${targetName}.pdf" to output.`);
    } catch (e) {
        console.error(`An error occurred while building "${targetName}".`);
        console.log(JSON.stringify(e, undefined, 2));
    }
}
