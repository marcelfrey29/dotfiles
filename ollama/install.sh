#!/usr/bin/env bash

echo "Downloading Models..."

# Install Ollama Models
# $1: array<string> the list of models to install
function ollama_install_models() {
    list=("$@")
    for list_item in "${list[@]}"; do
        echo "Installing \"${list_item}\"..."
        ollama pull $list_item 
        echo "Installed \"$list_item\"."
    done
}

# Model List
declare model_list=(
    # Meta Llama 3 8b (8K Context, 4.7GB): https://ollama.com/library/llama3
    "llama3.1:8b"
    # Google DeepMind Gemma 4 31b (256K Context, 20GB): https://ollama.com/library/gemma4
    # "gemma4:31b"
    # Google DeepMind Gemma 4 e4b (128 Context, 9.6GB): https://ollama.com/library/gemma4
    "gemma4:e4b"
)

ollama_install_models "${model_list[@]}"

echo "Models are downloaded."