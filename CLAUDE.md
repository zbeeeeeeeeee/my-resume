# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This is a **LaTeX resume project** (fork of Deedy-Resume-For-Chinese), not a software app. There is no test/lint/typecheck pipeline — verification means recompiling the PDF. For deeper details, see `AGENTS.md`.

## Build

Must use **XeLaTeX** (not pdflatex), run from the variant directory so `fonts/` is on the lookup path. `make` is not available on this machine; use the direct command:

```bash
cd src && xelatex -interaction=nonstopmode -halt-on-error resume.tex
```

- The photo file `张靖昊照片.jpg` is referenced by `resume.tex` and must be present in the variant directory for compilation to succeed.
- BibTeX is only needed if the commented-out `\bibliography{publications}` block in `resume.tex` is re-enabled.
- Expected font-shape warnings (small-caps substitution for 思源宋体) are harmless. Only `Error`/`! ` lines indicate real failures.
- **Success criterion**: PDF compiles without `Error`/`! ` lines. The resume currently spans 2 pages — this is expected.

## Architecture

Single-page, two-column Chinese resume using the Deedy template with open-source fonts (思源黑体 + 思源宋体, bundled in `fonts/`).

| Path | Role |
|---|---|
| `src/resume.tex` | **Primary file** — resume content (identity, education, skills, experience, projects) |
| `src/deedy-resume-openfont.cls` | Document class — page geometry, color scheme, section/heading macros, font config, compact list environment |
| `src/fonts/` | Bundled CJK fonts (Source Han Sans/Serif + FZYouSong) |
| `src/张靖昊照片.jpg` | Profile photo included in the left column |
| `scripts/build.sh` | Two-target build script (Chinese + English); invoked by Makefile |

> The `OpenFonts/` and `MacFonts/` directories referenced in upstream docs do not exist in this repo.

### Key macros (defined in `.cls`, used in `resume.tex`)

- `\namesection{name}{}{contact-line}` — centered name block with rule
- `\runsubsection{title}` — bold subsection header in right column
- `\descript{text}` — secondary descriptor line (job title, degree details)
- `\location{text}` — right-aligned date/location line
- `\sectionsep` — vertical spacer between sections
- `\tightemize` — compact itemize with reduced spacing
- `\lastupdated` — "Last Updated on <date>" watermark

### Layout

Two-column layout via `paracol` (left column ~30%, right column ~70%). Left column: photo, education, skills, awards, languages, links. Right column: work experience, R&D projects, training projects. Currently spans **two pages**.

## Compile quirks

- `resume.tex` ends with `\end{document}  \documentclass[]{article}` on the same line — an upstream template quirk. TeX stops at `\end{document}`, so this is harmless. Do not "fix" it.
- Font lookups use relative `Path = fonts/` in the `.cls` — build must be run from the variant directory.
- The `.cls` redefines `\refname` for the publications bibliography block.
- Auxiliary files (`.aux`, `.log`, `.out`) and `resume.pdf` are generated in the variant directory during build. They are gitignored but may accumulate locally.

## Editing conventions

- Content language is **Chinese**; section headers (教育经历, 技能, 所获荣誉, 语言能力, 工作经历, etc.) and skill-level labels (熟练/熟悉/了解) are established — match them.
- Placeholder strings like `待补充` mark unfilled fields. Preserve them rather than inventing content.
- Personal data is inline in `\namesection{张靖昊}{}{...}`.
- **After every content edit to `resume.tex`, recompile and verify single-page output** before considering the task done.
- `.bak` files (e.g. `resume.tex.bak`, `deedy-resume-openfont.cls.bak`) are manual backups of prior versions. Do not edit them; if you need to restore, verify with the user first.
