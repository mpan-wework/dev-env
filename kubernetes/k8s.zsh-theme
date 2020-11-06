kubernetes() {
    echo "%{$BG[033]%}%{$FG[016]%} $emoji[spouting_whale] ${KUBE_PS1_NAMESPACE} %{$reset_color%}"
}

helm() {
    echo "%{$BG[099]%}%{$FG[016]%} $emoji[wheel_of_dharma]  ${KUBE_PS1_CONTEXT} %{$reset_color%}"
}

prompt_indicator() {
    success="$emoji[rocket]"
    failure="$emoji[skull_and_crossbones]"
    echo "%(?.$success.$failure) %{$reset_color%}"
}

PROMPT='$(kubernetes)$(helm)%{$BG[236]%} %E%{$reset_color%}
$(prompt_indicator) %{$reset_color%}'
