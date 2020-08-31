#!/bin/bash

mydir="$(dirname "$(realpath "$0")")"

base_out="$mydir/../res/img"

export_rect() {
    w="$1"
    h="$2"
    in="$3"
    out="$4"
    inkscape -w "$w" -h "$h" --export-filename="$out" -C "$in"
}
export_square() {
    size="$1"
    in="$2"
    out="$3"
    export_rect "$1" "$size" "$in" "$out"
}

export_square 256 "$mydir/ic_launcher_sc.svg" "$base_out/element.png"

magick convert "$base_out/element.png" "$base_out/element.ico"

for f in "$base_out"/*; do
    pngcrush -ow "$f"
done
