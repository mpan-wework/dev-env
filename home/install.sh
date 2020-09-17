#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo === Script directory: $SCRIPT_DIR

function link() {
    link_src=$1
    link_dest=$2
    echo === Linking $link_dest with $link_src
    if [ -L "$link_dest" ]; then rm "$link_dest"; fi
    if [ -f "$link_dest" ]; then mv "$link_dest" "$link_dest.bak"; fi
    ln -sf "$link_src" "$link_dest"
    ls -al "$link_dest"
}

# ~/.zshrc
link $SCRIPT_DIR/.zshrc ~/.zshrc

# ~/.oh-my-zsh/themes/dev-env.zsh-theme
ZSH_THEME_DEST=~/.oh-my-zsh/themes/dev-env.zsh-theme
ZSH_THEME_SRC=$SCRIPT_DIR/dev-env.zsh-theme
link $ZSH_THEME_SRC $ZSH_THEME_DEST

# ~/.vimrc
link $SCRIPT_DIR/.vimrc ~/.vimrc

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
