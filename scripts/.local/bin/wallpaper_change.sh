#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CACHE_FILE="$HOME/.cache/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

SELECTED=$(ls -1 *.jpg *.png *.jpeg 2>/dev/null | rofi -dmenu -i -p "Wallpaper : ")

if [ -z "$SELECTED" ]; then
    exit 0
fi

TARGET_IMAGE="$WALLPAPER_DIR/$SELECTED"

echo "$TARGET_IMAGE" > "$CACHE_FILE"

POSITIONS=("center" "top" "bottom" "left" "right" "top-left" "top-right" "bottom-left" "bottom-right")

ARRAY_LENGTH=${#POSITIONS[@]}
RANDOM_INDEX=$(( RANDOM % ARRAY_LENGTH ))
TRANS_POS=${POSITIONS[$RANDOM_INDEX]}

awww img "$TARGET_IMAGE" \
    --transition-type grow \
    --transition-pos "$TRANS_POS" \
    --transition-step 90 \
    --transition-fps 60
