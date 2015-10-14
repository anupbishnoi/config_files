#!/bin/bash

cutstring="DO NOT EDIT BELOW THIS LINE"

if ! [[ -L "../.bashrc" ]]
then
  rm ../.bashrc
fi

for name in *; do
  target="$HOME/.$name"
  if [ -e $target ]; then
    if [ ! -L $target ]; then
      cutline=`grep -n -m1 "$cutstring" "$target" | sed "s/:.*//"`
      if [[ -n $cutline ]]; then
        let "cutline = $cutline - 1"
        echo "Updating $target"
        head -n $cutline "$target" > update_tmp
        if [ "$(uname)" == "Darwin" ]; then
          startline=`tail -r "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//"`
        else
          startline=`tac "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//"`
        fi
        if [[ -n $startline ]]; then
          tail -n $startline "$name" >> update_tmp
        else
          cat "$name" >> update_tmp
        fi
        mv update_tmp "$target"
      else
        echo "WARNING: $target exists but is not a symlink."
      fi
    fi
  else
    echo "Creating $target"
    if [[ -n `grep "$cutstring" "$name"` ]]; then
      cp "$PWD/$name" "$target"
    else
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

