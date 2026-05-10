#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CACHE_DIR="$HOME/.cache/hyprlock"
CACHE_FILE="$CACHE_DIR/current_wallpaper.png"

cd "$WALLPAPER_DIR" || exit 1

SELECTED=$(ls -1 *.jpg *.png *.jpeg *.gif *.webp 2>/dev/null | rofi -dmenu -i -p "Wallpaper ")

if [ -z "$SELECTED" ]; then
    exit 0
fi

TARGET_IMAGE="$WALLPAPER_DIR/$SELECTED"

awww img "$TARGET_IMAGE" \
    --transition-type grow \
    --transition-pos center \
    --transition-step 90 \
    --transition-fps 60

ffmpeg -y -i "$TARGET_IMAGE" -vframes 1 "$CACHE_FILE" -loglevel error

