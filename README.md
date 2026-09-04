# Lecture Notes

This repository holds some of my digital lecture notes for my studies in mathematics at the Technical University of Vienna, together with a frontend to serve them publicly.

## LaTeX

Most of the notes use a custom LaTeX class at `defs/lecture-notes.cls`, supplemented with custom macros at `defs/lecture-notes-macros.sty`.

To display metadata on the frontend, the application extracts data from the lecture documents at `lectures/<lecture-name>/document.tex`. This includes the `title`, `lecturer` and `semester`.

Lecture folders that contain a `.nopublish` file will be ignored.

## Frontend

Commands in this section are meant to be run inside the `www` directory.

### Installation

After pulling the repository, install the frontend packages using [bun](https://bun.com/).

```bash
bun install
```

### Generated Metadata

To generate the required metadata for the frontend, run

```bash
bun generate
```

### Local Frontend

The development server serves a local instance of the frontend.

```bash
bun dev
```
