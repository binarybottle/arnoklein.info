#!/bin/bash 

# this bash script writes an executable script that is to be run on images to be labeled by imagemagick

rm temp.sh
COUNTER=-1

for img in `ls *.jpg`

do 

let COUNTER=COUNTER+1

Q='"'
STRING=" -draw 'gravity southwest text 10,10 ""$Q""$COUNTER""$Q""'"

STRING="convert -font '-b&h-lucidatypewriter-medium-r-normal-sans-0-0-75-75-m-0-iso8859-4' -fill white \
$STRING \
$img labeled-$img"

echo $STRING >> temp.sh

done

# available fonts: identify -list type
#??? -font /Users/arno/Library/Fonts/Garamond -fill white -pointsize 28 \