#!/usr/bin/env bash

set -euxo pipefail

rm -rf work
mkdir -p work

extract_table () {
  cat "$1" | sed -n "/id=\"$2\"/,/<\/table>/{p}" | sed -n '/<table/,/<\/table>/{p}' > "work/$2.html"
}

extract_images () {
  xpath -q -e '/table/tbody/tr/td[3]' "work/$1.html" \
    | sed -e 's/<img/<img referrerpolicy="no-referrer"/g' \
          -e 's/<div>/<span>/g' \
          -e 's/<\/div>/<\/span>/g' \
          -e "s/<td>/<div class=\"isaac-image\" data-isaac-category=\"$1\">/" \
          -e 's/<\/td>/<\/div>/' \
          -e 's/href="/href="https:\/\/bindingofisaacrebirth.fandom.com/' \
    > "work/$1_images.html"
}

extract_description() {
  echo "[" > "work/$1_names.json"
  xpath -q -e '/table/tbody/tr/td[1]/@data-sort-value' "work/$1.html" | sed -e 's/.*\(".*"\)/\1,/' >> "work/$1_names.json"
  echo "\"\"]" >> "work/$1_names.json"
  xpath -q -e '/table/tbody/tr/td[5]' "work/$1.html" \
    | sed -e 's/<td>/<div class="isaac-description">/' \
          -e 's/<\/td>/<\/div>/' \
          -e 's/<img/<img referrerpolicy="no-referrer"/g' \
    > "work/$1_descriptions.html"
}

extract () {
  extract_table "$1" "$2"
  extract_images "$2"
  extract_description "$2"
}

extract raw/items.html "Activated_Collectibles"
extract raw/items.html "Passive_Collectibles"

extract raw/cards.html "Major_Arcana_Cards"
extract raw/cards.html "Reversed_Major_Arcana_Cards"
extract raw/cards.html "Playing_Cards"
#extract raw/cards.html "#Magic:_The_Gathering_Card_Backs"
extract raw/cards.html "Credit_Card_Back"
extract raw/cards.html "Other_Playing_Card_Backs"
extract raw/cards.html "Card_Against_Humanity_Back"
extract raw/cards.html "Chance_Card_Back"
extract raw/cards.html "Holy_Card_Back"
extract raw/cards.html "Uno_Card_Back"
extract raw/cards.html "Left_Pointing_Runes"
extract raw/cards.html "Right_Pointing_Runes"
extract raw/cards.html "Other_Runes"

extract raw/trinkets.html "All_Trinkets"
