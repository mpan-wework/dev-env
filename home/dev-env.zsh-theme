# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
# https://wiki.archlinux.org/index.php/Zsh#Colors
# https://www.rapidtables.com/code/text/unicode-characters.html

git_info() {
    ZSH_THEME_GIT_PROMPT_PREFIX=''
    ZSH_THEME_GIT_PROMPT_SUFFIX=''
    ZSH_THEME_GIT_PROMPT_DIRTY=' \u231b'
    ZSH_THEME_GIT_PROMPT_CLEAN=' \u2b50'
    echo "%{$fg[magenta]%}$(git_prompt_short_sha) %{$FG[051]%}$(git_prompt_info)"
}

directory() {
    echo "%{$fg[green]%}%0/"
}

prompt_indicator() {
    echo "%B%{$fg[green]%}\u2192%b"
}

current_date_time() {
    echo "%{$fg[yellow]%}%D{W%W-D%j %a %Y-%m-%d %H:%M:%S}"
}

return_status() {
    echo "%(?.%{$fg[green]%}\u2714.%{$fg[red]%}\u2718)"
}

PROMPT='%{$BG[236]%}$(git_info) $(directory)%E%{$reset_color%}
$(prompt_indicator) %{$reset_color%}'
RPROMPT="$(return_status) $(current_date_time)%{$reset_color%}"
