#!/usr/bin/env bash

text="$(xsel -o)"
IFS=$'\n' # Set the input field separator to newline
sentences=($(echo "$text" | sed 's/[.!?]/&\n/g')) # Split text into sentences

translated_text=""
for sentence in "${sentences[@]}"; do
    sentence=$(echo "$sentence" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//') # Trim leading and trailing spaces
    translate="$(wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=hy&dt=t&q=$(echo "$sentence" | sed "s/[\"'<>]//g")" | jq -r '.[0][0][0]')"
    translated_text="$translated_text\n$translate"
done

# Remove leading newline
translated_text="${translated_text#\\n}"

# Set the window dimensions (square)
window_dimensions="400x400"

zenity --info --title="Translation" --text="Translation:\n\n$translated_text" --width=500 --height=300

