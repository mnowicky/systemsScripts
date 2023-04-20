#!/bin/bash

DIR=$HOME/shot
TMP=/tmp/$(basename $0).tmp
test -d $DIR || mkdir $DIR
test -f $TMP && TEXT="$(cat $TMP)"
yad --title "Screen Shot Name" --entry --entry-text="$TEXT" --text "Enter Name of PNG Image:" > $TMP 2>/dev/null
FILE="$(cat $TMP)_$(date '+%Y%m%d-%H%M%S')"
# scrot -s "$DIR/$FILE.png"
xfce4-screenshooter --region --save "$DIR/$FILE.png"
exit 0
