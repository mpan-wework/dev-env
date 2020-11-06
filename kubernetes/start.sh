#!/usr/bin/env sh

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
set -e # exit if $? is non-zero

docker build --label k8s -t kube_console ${SCRIPTPATH}
docker images -f "label=k8s"
touch ${SCRIPTPATH}/.zsh_history
docker run --rm -it \
  -v ${SCRIPTPATH}/.kube:/root/.kube \
  -v ${SCRIPTPATH}/.zsh_history/:/root/.zsh_history \
  -v ${SCRIPTPATH}/.zshrc/:/root/.zshrc \
  -v ${SCRIPTPATH}/k8s.zsh-theme:/root/.oh-my-zsh/themes/k8s.zsh-theme \
  kube_console zsh
