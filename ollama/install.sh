#/bin/zsh

# Config: Select Models
EMBEDDINGS_MODEL="nomic-embed-text"
CHAT_MODEL="llama3.1:8b"
TAB_COMPLETION_MODEL="llama3.1:8b"

# Download all models
echo "Downloading Models..."
ollama pull $EMBEDDINGS_MODEL
ollama pull $CHAT_MODEL
ollama pull $TAB_COMPLETION_MODEL
echo "Downloaded Models."

# Make sure the Continue Config exists so that editing it with yq is safe
CONTINUE_CONFIG="$HOME/.continue/config.yaml"
if [ ! -f "$CONTINUE_CONFIG" ]; then
  touch $CONTINUE_CONFIG
fi

# General Config
yq -i '.name = "Continue Config"' "$CONTINUE_CONFIG"
yq -i '.version = "0.0.1"' "$CONTINUE_CONFIG"

# Embeddings Config
yq -i '.models[0].name = "Ollama Continue Embeddings"' "$CONTINUE_CONFIG"
yq -i '.models[0].provider = "ollama"' "$CONTINUE_CONFIG"
yq -i ".models[0].model = \"$EMBEDDINGS_MODEL\"" "$CONTINUE_CONFIG"
yq -i '.models[0].roles[0] = "embed"' "$CONTINUE_CONFIG"

# Chat Config
yq -i '.models[1].name = "Ollama Continue Chat"' "$CONTINUE_CONFIG"
yq -i '.models[1].provider = "ollama"' "$CONTINUE_CONFIG"
yq -i ".models[1].model = \"$CHAT_MODEL\"" "$CONTINUE_CONFIG"
yq -i '.models[1].roles[0] = "chat"' "$CONTINUE_CONFIG"

# Tab-Completion Config
yq -i '.models[2].name = "Ollama Continue Tab-Completion"' "$CONTINUE_CONFIG"
yq -i '.models[2].provider = "ollama"' "$CONTINUE_CONFIG"
yq -i ".models[2].model = \"$CHAT_MODEL\"" "$CONTINUE_CONFIG"
yq -i '.models[2].roles[0] = "autocomplete"' "$CONTINUE_CONFIG"

echo "Ollama and Continue are ready."