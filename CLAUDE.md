# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This is a **LaTeX resume project** (fork of Deedy-Resume-For-Chinese), not a software app. There is no test/lint/typecheck pipeline — verification means recompiling the PDF. For deeper details, see `AGENTS.md`.

## Build

Must use **XeLaTeX** (not pdflatex), run from the variant directory so `fonts/` is on the lookup path:

```bash
cd OpenFonts.Chinese && xelatex -interaction=nonstopmode -halt-on-error resume.tex
mv OpenFonts.Chinese/resume.pdf docs/resume-cn.pdf
```

- BibTeX is only needed if the commented-out `\bibliography{publications}` block in `resume.tex` is re-enabled.
- Expected font-shape warnings (small-caps substitution for 思源宋体) are harmless. Only `Error`/`! ` lines indicate real failures.
- **Success criterion**: `Output written on resume.pdf (1 page)`. If it reports 2+ pages, the edit caused overflow and must be trimmed.

## Architecture

Single-page, two-column Chinese resume using the Deedy template with open-source fonts (思源黑体 + 思源宋体, bundled in `fonts/`).

| Path | Role |
|---|---|
| `OpenFonts.Chinese/resume.tex` | **Primary file** — resume content (identity, education, skills, experience, projects) |
| `OpenFonts.Chinese/deedy-resume-openfont.cls` | Document class — page geometry, color scheme, section/heading macros, font config, compact list environment |
| `OpenFonts.Chinese/fonts/` | Bundled CJK fonts (Source Han Sans/Serif + FZYouSong) |
| `docs/` | Build output — committed PDFs (`resume-cn.pdf`) |
| `scripts/build.sh` | Two-target build script (Chinese + English); invoked by Makefile |
| `OpenFonts/` | English variant — contains **upstream sample data**, not the user's. Only edit if asked. |

### Key macros (defined in `.cls`, used in `resume.tex`)

- `\namesection{name}{}{contact-line}` — centered name block with rule
- `\runsubsection{title}` — bold subsection header in right column
- `\descript{text}` — secondary descriptor line (job title, degree details)
- `\location{text}` — right-aligned date/location line
- `\sectionsep` — vertical spacer between sections
- `\tightemize` — compact itemize with reduced spacing
- `\lastupdated` — "Last Updated on <date>" watermark

### Layout

Two-column layout via `paracol` (left column ~30%, right column ~70%). Left column: photo, education, links, skills. Right column: work experience, projects, awards. Designed to fit exactly **one page**.

## Compile quirks

- Both `resume.tex` files end with `\end{document}  \documentclass[]{article}` on the same line — an upstream template quirk. TeX stops at `\end{document}`, so this is harmless. Do not "fix" it.
- Font lookups use relative `Path = fonts/` in the `.cls` — build must be run from the variant directory.
- The `.cls` redefines `\refname` for the publications bibliography block.

## Editing conventions

- Content language is **Chinese**; section headers and skill-level labels (熟练/熟悉/了解) are established — match them.
- Placeholder strings like `待补充` mark unfilled fields. Preserve them rather than inventing content.
- Personal data is inline in `\namesection{张靖昊}{}{...}`.
- After every content edit to `resume.tex`, recompile and verify single-page output before considering the task done.
