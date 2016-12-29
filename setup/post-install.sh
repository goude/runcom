#!/usr/bin/env bash
echo "Performing post-installation..."

../home/bin/runcom-setup-git

ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf
ln -s $HOME/.npmrc-template $HOME/.npmrc

# Force antigen install
if [[ -f $HOME/.zshrc ]]; then
  zsh -c "source $HOME/.zshrc"
fi

# Set initial color scheme
ln -s $HOME/.homesick/repos/base16-shell/scripts/base16-monokai.sh $HOME/.base16_theme
cp $HOME/.homesick/repos/runcom/setup/vimrc_background $HOME/.vimrc_background
