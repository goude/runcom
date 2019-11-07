## Install the Adafruit TFT
```
wget https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/adafruit-pitft.sh
chmod a+x ./adafruit-pitft.sh
sudo ./adafruit-pitft.sh
```

## Rust
```
curl https://sh.rustup.rs -sSf | sh
rustup override set stable
source $HOME/.cargo/env
rustup override set stable
rustup update stable
```

## Enable a large swapfile
```
dd if=/dev/zero of=/home/pi/swapfile bs=1024 count=1M
mkswap swapfile
sudo swapon swapfile
swapon -s
```
