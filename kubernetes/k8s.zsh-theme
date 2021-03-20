k8s_context() {
    echo "%{$BG[098]%}%{$fg[white]%} ctx: ${KUBE_PS1_CONTEXT} %{$reset_color%}"
}

k8s_namespace() {
    echo "%{$BG[032]%}%{$FG[254]%} ns: ${KUBE_PS1_NAMESPACE} %{$reset_color%}"
}

directory_part() {
    echo "%{$fg[green]%}%0/"
}

prompt_indicator() {
    success="%{$FG[010]%}\u2714"
    failure="%{$FG[009]%}\u2718"
    echo "%(?.$success.$failure) %{$reset_color%}"
}

PROMPT='$(k8s_context)$(k8s_namespace)%{$BG[236]%} $(directory_part) %E%{$reset_color%}
$(prompt_indicator) %{$reset_color%}'
