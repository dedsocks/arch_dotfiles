#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CACHE_FILE="$HOME/.cache/current_wallpaper"

cd "$WALLPAPER_DIR" || exit 1

SELECTED=$(ls -1 *.jpg *.png *.jpeg *.gif 2>/dev/null | rofi -dmenu -i -p "Wallpaper ")

if [ -z "$SELECTED" ]; then
    exit 0
fi

TARGET_IMAGE="$WALLPAPER_DIR/$SELECTED"

ln -sf "$TARGET_IMAGE" "$CACHE_FILE"

awww img "$TARGET_IMAGE" \
    --transition-type grow \
    --transition-pos center \
    --transition-step 90 \
    --transition-fps 60
