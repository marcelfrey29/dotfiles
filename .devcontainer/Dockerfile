FROM debian:13.2

# Install necessary packages
RUN apt-get update && apt-get install -y \
    zsh \
    rsync \
    git \
    curl \
    vim

# Use zsh as default shell
RUN chsh -s /bin/zsh
