#!/bin/zsh

echo "Building and installing Rust binaries..."

cargo install diesel_cli --no-default-features --features postgres # Only install Postgres 
cargo install trunk
cargo install wasm-bindgen-cli # For "trunk": Required for Apple M1

echo "Installed Rust binaries."
