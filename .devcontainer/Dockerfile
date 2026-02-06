FROM debian:13.3

# Install necessary packages
RUN apt-get update && apt-get install -y \
    zsh \
    rsync \
    git \
    curl \
    vim

# Use zsh as default shell
RUN chsh -s /bin/zsh

# Create necessary directories (mount points)
RUN mkdir -p ~/.cmd-history
