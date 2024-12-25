#!/bin/bash

echo "Installing custom configurations..."

# starship install
curl -sS https://starship.rs/install.sh | sh -s -- -y
# asdf install
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. "$HOME/.asdf/asdf.sh"
# rust install
asdf plugin add rust
asdf install rust latest
sdf global rust latest
# sheldon install
cargo install sheldon

echo "----場所の把握----"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo $SCRIPT_DIR
echo $PWD

ln -sf "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
ln -sfn "$SCRIPT_DIR/.config" "$HOME/.config"

echo "Dotfiles setup complete!"