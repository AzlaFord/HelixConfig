#!/usr/bin/env bash
set -e

# Helix itself and the tools needed to install the rest (Fedora)
sudo dnf install -y helix nodejs npm golang pipx

# Node-based language servers and formatters
sudo npm i -g \
  typescript typescript-language-server \
  vscode-langservers-extracted \
  @tailwindcss/language-server \
  emmet-ls \
  prettier \
  pyright

# Python
pipx install ruff

# Go
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# Link this repo into place as the Helix config
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p ~/.config
if [ -e ~/.config/helix ] && [ ! -L ~/.config/helix ]; then
  echo "~/.config/helix already exists and is not a symlink."
  echo "Move or delete it, then run this script again."
  exit 1
fi
ln -sfn "$REPO_DIR" ~/.config/helix

echo "Done. Make sure ~/go/bin and ~/.local/bin are on your PATH, then run: hx --health"
