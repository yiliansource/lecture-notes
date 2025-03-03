import { exec as execCallback } from "child_process";
import { promisify } from "util";

export const exec = promisify(execCallback);

export interface CommitInformation {
    hash: string;
    message: string;
    added: string[];
    changed: string[];
    removed: string[];
}

export async function getLatestCommit(): Promise<CommitInformation> {
    // Exec output contains both stderr and stdout outputs
    const gitOutput = await exec("git show --name-status HEAD --oneline");

    console.log(gitOutput);

    return {
        hash: "",
        message: "",
        added: [],
        changed: [],
        removed: [],
    };
}
