FROM debian:13.6

# Set Locale
ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"

# Install Core Packages and use "zsh" as default shells
RUN apt-get update && apt-get install --no-install-recommends -y \
    zsh \
    rsync \
    git \
    curl \
    vim \
    tree \
    htop \
    dnsutils
RUN chsh -s /bin/zsh

# Shared Command History (mount point)
RUN mkdir -p ~/.cmd-history

# Setup Dotfiles in Container
RUN cd ~ && git clone https://github.com/marcelfrey29/dotfiles.git && cd dotfiles && ./install.sh

# Install Trivy
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.74.0

# Use Host SSH Config & Keys
RUN apt-get install --no-install-recommends -y ssh
RUN mkdir -p ~/.ssh

# Kubernetes (kubectl)
ARG K8S_VERSION="1.35"
RUN apt-get install --no-install-recommends -y apt-transport-https ca-certificates curl gnupg && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v$K8S_VERSION/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v$K8S_VERSION/deb/ /" | tee /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl
RUN mkdir -p ~/.kube
