#!/usr/bin/env bash

set -euxo pipefail

rm -rf images
mkdir -p images
mkdir -p images/20

IFS=$'\n'

download_images () {
  curls=$(xpath -q -e '/table/tbody/tr/td//a/img' "work/$1.html" \
    | sed -e 's/^.*alt="\([^"]*\)".*src="\([^"]*\)".*$/curl "\2" -o "images\/\1.png"/')
  for c in $curls; do
    eval $c
  done
}

download_images "Activated_Collectibles"
download_images "Passive_Collectibles"

download_images "Major_Arcana_Cards"
download_images "Reversed_Major_Arcana_Cards"
download_images "Playing_Cards"
download_images "Special_Cards"
download_images "Left_Pointing_Runes"
download_images "Right_Pointing_Runes"
download_images "Other_Runes"

download_images "All_Trinkets"
