#!/usr/bin/env bash
sudo sed -i.bak /etc/default/keyboard -e s/^XKBOPTIONS=$/XKBOPTIONS="terminate:ctrl_alt_bksp,ctrl:nocaps"/

sudo dpkg-reconfigure keyboard-configuration
