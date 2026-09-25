#!/usr/bin/env bash
# Setup script for personal local-llm-cli suite
# Ensures tools are executable and adds repo directly to shell PATH

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up Local LLM CLI environment..."

chmod +x "${REPO_DIR}"/* 2>/dev/null || true

PATH_LINE="export PATH=\"${REPO_DIR}:\$PATH\""

for rc_file in "${HOME}/.bashrc" "${HOME}/.zshrc"; do
  if [ -f "$rc_file" ]; then
    if ! grep -q "local-llm-cli" "$rc_file"; then
      echo "" >> "$rc_file"
      echo "# Personal Local LLM CLI Suite" >> "$rc_file"
      echo "$PATH_LINE" >> "$rc_file"
      echo "  -> Added PATH export to ${rc_file}"
    else
      echo "  -> PATH export already present in ${rc_file}"
    fi
  fi
done

echo ""
echo "Setup complete!"
echo "Repository path: ${REPO_DIR}"
