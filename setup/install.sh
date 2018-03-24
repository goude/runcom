#!/usr/bin/env bash
echo "Installing/updating runcom..."

./setup-homeshick.sh

echo "Performing post-installation..."

ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf

# Set initial color scheme
ln -s $HOME/.local/share/base16/templates/shell/scripts/base16-gruvbox-dark-pale.sh $HOME/.base16_theme
source $HOME/.local/share/base16/templates/shell/scripts/base16-gruvbox-dark-pale.sh

./install-prog-envs.sh

# Force antigen install
if [[ -f $HOME/.zshrc ]]; then
  zsh -c "source $HOME/.zshrc"
fi

