#!/usr/bin/env bash

echo "Setting up Marcels Home Directory...."

cd ~

# Cryptomator Mount Points
mkdir -p Marcels-Documents
mkdir -p Marcels-Images
mkdir -p Marcels-Music
mkdir -p Marcels-Videos
mkdir -p Marcels-Workspaces

# Developer
mkdir -p Developer/GitHub/marcelfrey29
mkdir -p Developer/GitLab/marcelfrey29
mkdir -p Developer/Local/marcelfrey29
mkdir -p Developer/Playground/marcelfrey29

# Docker Volumes
# Example Mount: ~/.docker_volumes/<project>/<container>/<[...]>:/path/in/container
mkdir -p .docker_volumes

echo "Home directory is ready."
