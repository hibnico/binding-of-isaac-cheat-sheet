#!/usr/bin/env bash

set -euxo pipefail

pages=(\
  "Activated_Collectibles" \
  "Passive_Collectibles" \
  "All_Trinkets" \
  "Major_Arcana_Cards" \
  "Reversed_Major_Arcana_Cards" \
  "Playing_Cards" \
  "Credit_Card_Back" \
  "Other_Playing_Card_Backs" \
  "Card_Against_Humanity_Back" \
  "Chance_Card_Back" \
  "Holy_Card_Back" \
  "Uno_Card_Back" \
  "Left_Pointing_Runes" \
  "Right_Pointing_Runes" \
  "Other_Runes" \
)

cp header.html index.html

{
  echo "<script>all_names={};isaac_images_colors="
  cat work/colors.json
  echo "</script>"
} >> index.html

for p in "${pages[@]}"; do
  title=$(echo "$p" | tr "_" " ")
  {
    echo "<div class=\"category\" id=\"$p\">"
    echo "<h2>$title</h2>"
    echo "<div class=\"images\">"
    cat "work/${p}_images.html"
    echo "<div class=\"isaac-descriptions\">"
    cat "work/${p}_descriptions.html"
    echo "</div></div></div>"
    echo "<script>all_names[\"${p}\"]="
    cat "work/${p}_names.json"
    echo "</script>"
  } >> index.html
done
cat footer.html >> index.html
