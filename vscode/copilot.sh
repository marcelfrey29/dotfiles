#!/usr/bin/env bash

echo "Setting up Copilot..."

# Agents
# https://opencode.ai/docs/agents/#markdown
mkdir -p ~/.copilot/agents/
rsync -vrh --exclude ".DS_Store" ../ai/agents/ ~/.copilot/agents/

# Skills
# https://code.visualstudio.com/docs/copilot/customization/agent-skills#_create-a-skill
mkdir -p ~/.copilot/skills/
rsync -vrh --exclude ".DS_Store" ../ai/skills/ ~/.copilot/skills/

echo "Copilot setup complete."
