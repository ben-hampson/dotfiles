#!/usr/bin/env bash

git submodule update --init --recursive

sudo dnf install -y \
  speedtest-cli \
  btop \
  fzf \
  1password \ # needs repos 
  translate-shell \
  lolcat \
  python3-pip \
  mutt \
  yq \
  kubectl

brew install \
  argocd \
  openshift-cli \
  caarlos0/tap/timer

curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh

pip install shell-gpt

# Hyprland
sudo dnf install -y rofi-wayland waybar hyprpaper pipewire wireplumber fastfetch btop swaync blueman xdg-desktop-portal-hyprland xdg-desktop-portal-gtk 
# sudo nano /usr/lib/systemd/logind.conf, set HandleLidSwitch=ignore to not suspend when closing lid, for clamshell mode.

mkdir ~/log

# Compile espanso:
# https://espanso.org/docs/install/linux#x11-compile
