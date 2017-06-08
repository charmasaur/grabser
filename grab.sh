#!/usr/bin/env bash

fn=$(ls -t ~/Downloads | head -1)
echo Using $fn
copy_commands=(xclip pbcopy)
for i in "${copy_commands[@]}" ; do
  hash $i 2>/dev/null && { cat ~/Downloads/$fn | $i; echo "Copied to clipboard"; break; }
done
