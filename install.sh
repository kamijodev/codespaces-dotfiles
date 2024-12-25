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


ln -sf "/workspaces/.codespaces/.persistedshare/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "/workspaces/.codespaces/.persistedshare/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "/workspaces/.codespaces/.persistedshare/dotfiles/.config/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "/workspaces/.codespaces/.persistedshare/dotfiles/.config/sheldon" "$HOME/.config/sheldon"

echo "Dotfiles setup complete!"