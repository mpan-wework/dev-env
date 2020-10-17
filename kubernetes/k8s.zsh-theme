directory() {
    echo "%{$fg[green]%}%0/"
}

prompt_indicator() {
    echo "%B%{$fg[cyan]%}\u2744%b"
}

PROMPT='$(directory) $(prompt_indicator) %{$reset_color%}'
