# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
# https://wiki.archlinux.org/index.php/Zsh#Colors

directory() {
    echo "%{$fg[green]%}%0/"
}

prompt_indicator() {
    echo "%B%{$fg[green]%}\u2192%b"
}

current_date_time() {
    echo "%{$fg[yellow]%}%D{W%W-D%j %a %Y-%m-%f %H:%M:%S}"
}

return_status() {
    echo "%(?.%{$fg[green]%}\u2714.%{$fg[red]%}\u2718)"
}

PROMPT='%{$BG[236]%}$(git_prompt_info) $(directory)%E%{$reset_color%}
$(prompt_indicator) %{$reset_color%}'
RPROMPT="$(return_status) $(current_date_time)%{$reset_color%}"
