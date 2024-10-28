#!/bin/bash

# Check if an agent name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <agent_name>"
  exit 1
fi

AGENT_NAME=$1
CONFIG_FILE="agent_configs/${AGENT_NAME}.yaml"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Configuration file for agent '$AGENT_NAME' not found."
  exit 1
fi

# Extract file list from the YAML configuration
FILES=$(yq eval '.files | join(" ")' "$CONFIG_FILE")

# Run aider with the specified files
aider $FILES
