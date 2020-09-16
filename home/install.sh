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

# vscode settings.json
VSCODE_JSON=vscode.json
VSCODE_SETTINGS=User/settings.json
for VSCODE in "/Users/$USER/Library/Application Support/Code" "/Users/$USER/Library/Application Support/Code - Insiders" "/Users/$USER/Library/Application Support/VSCodium"
do
    if [ -L "$VSCODE/$VSCODE_SETTINGS" ]; then rm "$VSCODE/$VSCODE_SETTINGS"; fi
    if [ -f "$VSCODE/$VSCODE_SETTINGS" ]; then mv "$VSCODE/$VSCODE_SETTINGS" "$VSCODE/$VSCODE_SETTINGS.bak"; fi
    ln -sf "$SCRIPT_DIR/$VSCODE_JSON" "$VSCODE/$VSCODE_SETTINGS"
    ls -al "$VSCODE/$VSCODE_SETTINGS"
done
