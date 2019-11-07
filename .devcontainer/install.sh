#!/bin/bash

 apt-get update \
 && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common lsb-release \
 && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | apt-key add - 2>/dev/null \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" \
 && apt-get update \
 && apt-get install -y docker-ce-cli && \
 curl https://deislabs.blob.core.windows.net/porter/latest/install-linux.sh | bash && \
 curl -o helm.tgz https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VER}-linux-amd64.tar.gz && \
 tar -xzf helm.tgz && \
 mv linux-amd64/helm /usr/local/bin && \
 rm helm.tgz && \
 helm init --client-only && \
 curl https://sh.rustup.rs -sSf | sh && \
 wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz && \
 sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz && \
 rm -rf go$GO_VERSION.linux-amd64.tar.gz
