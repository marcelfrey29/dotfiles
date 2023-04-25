#!/bin/zsh

echo "Building and installing Rust binaries..."

cargo install diesel_cli --no-default-features --features postgres # Only install Postgres 

echo "Installed Rust binaries."
