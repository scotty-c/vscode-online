 
FROM docker:dind

ENV HELM_VER 2.12.3
ENV GO_VERSION 1.12.6

RUN apk add bash \
            git \
            curl \ 
            bash-completion \ 
            jq \
            ca-certificates && \
    curl https://deislabs.blob.core.windows.net/porter/latest/install-linux.sh | bash && \
    curl -o helm.tgz https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VER}-linux-amd64.tar.gz && \
    tar -xzf helm.tgz && \
    mv linux-amd64/helm /usr/local/bin && \
    rm helm.tgz && \
    helm init --client-only && \
    curl https://sh.rustup.rs -sSf | sh && \
    wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz && \
    sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz && \
    rm -rf go$GO_VERSION.linux-amd64.tar.gz && \

ENV PATH="$PATH:/root/.porter"