#!/usr/bin/env bash

unset -v fn
for file in ~/Downloads/*; do
  [[ $file -nt $fn ]] && fn=$file
done

echo Using $fn
copy_commands=(xclip pbcopy)
for i in "${copy_commands[@]}" ; do
  hash $i 2>/dev/null && { cat "$fn" | $i; echo "Copied to clipboard"; break; }
done
