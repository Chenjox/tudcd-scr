#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator

# Generate all files from the .ins file to create classes and packages
latex tudcd.ins

# Then generate the documentation files
for file in *; do
  fileextension=${file##*.}
  if [[ -f $file && $fileextension == "dtx" ]]; then
    pdflatex -interaction=nonstopmode $file
  fi
done