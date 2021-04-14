
# A Cheat Sheet for the game The Binding of Isaac

Playing at The Binding of Isaac, in the shop, you have items in front of you you don't know, or you don't remember. This great [wiki](https://bindingofisaacrebirth.fandom.com/wiki/Binding_of_Isaac:_Rebirth_Wiki) contains all the information but isn't handy to search for items visually.

While waiting for a mod to show information within the game, a bunch of curl and sed commands, some jquery, and I quickly got a page with all the icons. Then more effort to order by color and putting some css, here is a nice cheat sheet.

## Building the page

Some tools are required: `curl`, `sed`, `path`, `convert` of ImageMagick

- `./download-pages.sh` to download locally the wiki pages describing the items
- `./extract.sh` to extract the item names, descriptions and the image references
- `./download-images.sh` to download locally the images of every item
- `./compute-colors.sh` to compute the average colors of the images
- `./build.sh` to aggregated everything in one web page

Then open the generated index.html and enjoy.

This generated page is also hosted there: https://www.hibnet.org/isaac/

## Implementation notes

The tools used are crap and outdated ? I know. But who cares, it just took me a few hours, it works, I just want to play!
