FROM debian:13.3

# Set locale
ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"

# Install necessary packages
RUN apt-get update && apt-get install -y \
    zsh \
    rsync \
    git \
    curl \
    vim \
    tree

# Use zsh as default shell
RUN chsh -s /bin/zsh

# Create necessary directories (mount points)
RUN mkdir -p ~/.cmd-history

# Use Host SSH Config & Keys
RUN apt-get install -y ssh
RUN mkdir -p ~/.ssh

# Install OpenCode
RUN curl -fsSL https://opencode.ai/install | bash

# Kubernetes (kubectl)
ARG K8S_VERSION="1.35"
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v$K8S_VERSION/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$K8S_VERSION/deb/ /" | tee /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl
RUN mkdir -p ~/.kube