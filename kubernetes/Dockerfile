FROM alpine:3.12 AS builder
WORKDIR /root
RUN apk add --update bash build-base curl git \
    ncurses sed tar tzdata zsh \
    && rm -rf /var/cache/apk/*
RUN curl -LO https://dl.k8s.io/v1.18.10/kubernetes-client-linux-amd64.tar.gz \
    && tar --strip-components=3 -zxvf kubernetes-*.tar.gz kubernetes/client/bin/kubectl \
    && rm -f kubernetes-*.tar.gz \
    && mv kubectl /usr/local/bin/
RUN curl -LO https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz \
    && tar --strip-components=1 -zxvf helm-*.tar.gz linux-amd64/helm \
    && rm -f helm-*.tar.gz \
    && mv helm /usr/local/bin/

# zsh
ENV ZSH_PLUGINS=/root/.oh-my-zsh/custom/plugins
RUN git clone --depth=1 --single-branch https://github.com/ohmyzsh/ohmyzsh \
    && sh ohmyzsh/tools/install.sh \
    && rm -rf ohmyzsh
RUN git clone --depth=1 --single-branch \
    https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_PLUGINS}/zsh-autosuggestions \
    && rm -rf ${ZSH_PLUGINS}/zsh-autosuggestions/.git
RUN git clone --depth=1 --single-branch https://github.com/jonmosco/kube-ps1 \
    ${ZSH_PLUGINS}/kube-ps1 \
    && rm -rf ${ZSH_PLUGINS}/kube-ps1/.git

# util
ENV LOCAL_DIR=/root/.local
RUN git clone --depth=1 --single-branch https://github.com/ahmetb/kubectx.git \
    /root/.local/kubectx \
    && cp ${LOCAL_DIR}/kubectx/kubectx /usr/local/bin/ \
    && cp ${LOCAL_DIR}/kubectx/kubens /usr/local/bin/ \
    && rm -rf ${LOCAL_DIR}/kubectx
