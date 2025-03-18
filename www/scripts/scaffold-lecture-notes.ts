import { prompt } from "enquirer";
import fs from "fs";
import path from "path";

async function scaffold() {
    const date = new Date();
    const isSummer = date.getMonth() >= 2 && date.getMonth() < 9;
    const defaultSemester = date.getFullYear() + (isSummer ? "S" : "W");

    const response = await prompt<{ title: string; lecturer: string; semester: string }>([
        {
            type: "input",
            name: "title",
            message: "What is the name of the lecture?",
        },
        {
            type: "input",
            name: "lecturer",
            message: "What is the name of the lecturer?",
        },
        {
            type: "input",
            name: "semester",
            initial: defaultSemester,
            message: "Which semester was the lecture held?",
        },
    ]);

    const { title, lecturer, semester } = response;

    const folderName = title.toLowerCase().replaceAll(/ /g, "-");
    const folderPath = path.join(process.cwd(), "..", "lectures", folderName);

    const templatePath = path.join(process.cwd(), "..", "template", "document.tex.template");
    const latexTemplate = fs.readFileSync(templatePath, "utf-8");

    const setLatexVariable = (s: string, key: string, value: string): string =>
        s.replace(new RegExp(`(\\\\${key}\{).*(\})`), "$1" + value + "$2");

    let latexFile = latexTemplate;
    for (const [key, value] of Object.entries({ title, lecturer, semester })) {
        latexFile = setLatexVariable(latexFile, key, value);
    }

    fs.mkdirSync(folderPath, { recursive: true });
    fs.writeFileSync(path.join(folderPath, "document.tex"), latexFile);
}

scaffold();
