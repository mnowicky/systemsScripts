#!/bin/bash

step=1
for pic in `find . -maxdepth 1 -iname '*.jpg' -type f`
do
   new=image-$step.${pic##*.}
   echo "Renaming $pic to $new"
   mv "$pic" "$new"
   let step++
done
