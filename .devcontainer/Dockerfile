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
    vim

# Use zsh as default shell
RUN chsh -s /bin/zsh

# Create necessary directories (mount points)
RUN mkdir -p ~/.cmd-history
