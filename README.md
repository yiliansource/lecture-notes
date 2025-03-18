# Lecture Notes

This repository holds some of my digital lecture notes for my studies in mathematics at the Technical University of Vienna, together with a frontend to serve them publicly.

## LaTeX

The notes use a custom LaTeX class at `defs/lecture-notes.cls`, supplemented with custom macros at `defs/lecture-notes-macros.sty`.

To display metadata on the frontend, the application extracts data from the lecture documents at `lectures/<lecture-name>/document.tex`. This includes the `title`, `lecturer` and `semester`.

## Frontend

Commands in this section are meant to be run inside the `www` directory.

### Installation

After pulling the repository, install the frontend packages using yarn.

```console
yarn install
```

### Local Frontend

The development server serves a local instance of the frontend. When building, data will be statically rendered. Note that the lecture document .pdfs will not be available, as they are copied at export time.

```console
yarn dev
```

### Create new lecture

Using the scaffold command, an interactive wizard creates the folder structure for a new lecture.

```console
yarn scaffold
```