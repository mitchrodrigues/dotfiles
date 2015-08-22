#!/usr/bin/env bash

echo "\n"
echo "============"
echo "= Symlinks ="
echo "============"
for f in $(find ~/.dotfiles/symlinks -maxdepth 1 -iname '.*')
 do ln -s $f ~/
done
echo "\n"
ls -alh ~/

echo "\n"
echo "============"
echo "= Homebrew ="
echo "============"
sh ~/.dotfiles/brew.sh
