#!/bin/bash
# Copy dotfiles to home directory
for f in $(ls -1 dotfiles/*); do cp $f ${f/dotfiles\//~/.}; done
