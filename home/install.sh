#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo Script directory: $SCRIPT_DIR

# ~/.zshrc
ZSHRC=.zshrc
if [ -L ~/$ZSHRC ]; then rm ~/$ZSHRC; fi
if [ -f ~/$ZSHRC ]; then mv ~/$ZSHRC ~/$ZSHRC.bak; fi
ln -sf $SCRIPT_DIR/$ZSHRC ~/$ZSHRC
ls -al ~/$ZSHRC

# ~/.vimrc
VIMRC=.vimrc
if [ -L ~/$VIMRC ]; then rm ~/$VIMRC; fi
if [ -f ~/$VIMRC ]; then mv ~/$VIMRC ~/$VIMRC.bak; fi
ln -sf $SCRIPT_DIR/$VIMRC ~/$VIMRC
ls -al ~/$VIMRC
