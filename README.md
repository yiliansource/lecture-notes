# Lecture Notes

This repository holds some of my digital lecture notes for my studies in mathematics at the Technical University of Vienna, together with a frontend to serve them publicly.

## Lecture structure

There is a custom LaTeX class at `defs/lecture-notes.cls`, supplemented with custom macros at `defs/lecture-notes-macros.sty`.

Any folder inside `lectures/` will be considered a lecture folder. Lecture folders are expected to contain a `manifest.json` describing metadata such as the lecture title, the lecturer's name and the semester it was held in, and a unique `.pdf` holding the actual compiled notes. 

Lecture folders that contain a `.nopublish` file will be ignored.

## Frontend

Commands in this section are meant to be run inside the `www` directory.

### Installation

After pulling the repository, install the frontend packages using [bun](https://bun.com/):

```bash
bun install
```

### Generated Metadata

To generate the required metadata for the frontend and copy the `.pdf`s to the `public/` folder on the frontend, run:

```bash
bun generate
```

### Local Frontend

The development server serves a local instance of the frontend:

```bash
bun dev
```
