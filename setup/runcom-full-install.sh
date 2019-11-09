#!/usr/bin/env bash
echo "Full runcom install (zsh + pyenv + neovim)"

./runcom-base-install.sh

# Set initial color scheme
ln -s $HOME/.local/share/base16/templates/shell/scripts/base16-gruvbox-dark-pale.sh $HOME/.base16_theme
source $HOME/.local/share/base16/templates/shell/scripts/base16-gruvbox-dark-pale.sh
cp ./data/vimrc_background ~/.vimrc_background

./install-prog-envs.sh

# Force antigen install
if [[ -f $HOME/.zshrc ]]; then
  zsh -c "source $HOME/.zshrc"
fi

