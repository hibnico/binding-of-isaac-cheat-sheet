#!/usr/bin/env bash

set -euxo pipefail

rm -rf raw
mkdir -p raw
curl https://bindingofisaacrebirth.fandom.com/wiki/Items > raw/items.html
curl https://bindingofisaacrebirth.fandom.com/wiki/Pills > raw/pills.html
curl https://bindingofisaacrebirth.fandom.com/wiki/Cards_and_Runes > raw/cards.html
curl https://bindingofisaacrebirth.fandom.com/wiki/Trinkets > raw/trinkets.html
