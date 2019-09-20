#!/usr/bin/env bash
echo "Installing neovim from source..."

echo "Installing prerequisites..."
#sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

echo "Building..."
cd "$RUNCOM_TMPDIR" || exit 255

git clone https://github.com/neovim/neovim.git

cd neovim

#make CMAKE_BUILD_TYPE=RelWithDebInfo
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"

make install

ln -sf "$HOME/.local/neovim/bin/nvim" "$HOME/bin/nvim"
