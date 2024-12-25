#!/bin/bash

echo "Installing custom configurations..."

# starship install
curl -sS https://starship.rs/install.sh | sh
# asdf install
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. "$HOME/.asdf/asdf.sh"
# rust install
asdf plugin add rust
asdf install rust latest
sdf global rust latest
# sheldon install
cargo install sheldon

ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"

echo "Dotfiles setup complete!"