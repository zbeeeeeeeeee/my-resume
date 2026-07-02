#!/usr/bin/env bash

ROOT=$(dirname "${BASH_SOURCE}")/..
CHINESE_DIR="src"
ENGLISH_DIR="OpenFonts"

cd ${ROOT}
cd ${CHINESE_DIR}
xelatex ./resume.tex
cd - > /dev/null
cd ${ENGLISH_DIR}
xelatex ./resume.tex
cd - > /dev/null
cd - > /dev/null
