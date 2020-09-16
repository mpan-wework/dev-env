#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo Script directory: $SCRIPT_DIR

# ~/.vimrc
if [ -L ~/.vimrc ]; then rm ~/.vimrc; fi
if [ -f ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc.bak; fi
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ls -al ~/.vimrc
