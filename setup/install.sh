#!/usr/bin/env bash
echo "Installing/updating runcom..."

./setup-homeshick.sh
./setup-pyenv.sh
./setup-neovim.sh

echo "Performing post-installation..."

ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf
ln -s $HOME/.npmrc-template $HOME/.npmrc

# Force antigen install
if [[ -f $HOME/.zshrc ]]; then
  zsh -c "source $HOME/.zshrc"
fi

# After .npmrc setup above
./setup-nvm.sh
./setup-node.sh

# Set initial color scheme
ln -s $HOME/.local/share/base16/templates/shell/scripts/base16-gruvbox-dark-soft.sh $HOME/.base16_theme
cp $HOME/.homesick/repos/runcom/setup/vimrc_background $HOME/.vimrc_background
