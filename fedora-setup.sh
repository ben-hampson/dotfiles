#!/usr/bin/env bash

sudo dnf install -y \
  speedtest-cli \
  btop \
  espanso-wayland \
  fzf \
  1password \ # needs repos 
  translate-shell \
  lolcat \
  python3-pip \
  mutt

brew install \
  argocd \
  openshift-cli \
  caarlos0/tap/timer

curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh

pip install shell-gpt

# Hyprland
sudo dnf install -y rofi waybar
