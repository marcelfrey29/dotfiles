#!/bin/zsh

echo "Building and installing Rust binaries..."

cargo install diesel_cli --no-default-features --features postgres # Only install Postgres 
cargo install trunk
cargo install wasm-bindgen-cli # For "trunk": Required for Apple M1
cargo install leptosfmt # To format `view!` macros in Leptos-Projects

echo "Installed Rust binaries."
