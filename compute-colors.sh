#!/usr/bin/env bash

set -euxo pipefail

images=$(find images -iname "*.png" | cut -d '/' -f2- | rev | cut -c 5- | rev | sed -e 's/?/\\?/g')

mkdir -p work
echo "{" > work/colors.json

IFS=$'\n'
for i in $images; do
  color=$(convert "images/$i.png" -scale 1x1+0+0 -depth 8 txt:- \
    | sed -n -e 's/.* \(#[0-9A-F]*\) .*/\1/p')
  name=${i//\\\?/?}
  name=${name//&lt;/<}
  echo "  \"$name\": \"$color\"," >> work/colors.json
done
echo "  \"\":\"\"" >> work/colors.json
echo "}" >> work/colors.json
