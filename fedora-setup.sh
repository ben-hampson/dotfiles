#!/usr/bin/env bash

git submodule update --init --recursive

# Install oh-my-zsh. This has to be done before expanding the dotfiles oh-my-zsh setup moves existing .zshrc out the way and replaces it with its own one.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc

# stow dotfiles
cd $HOME/dotfiles
git submodule update --init --recursive
stow . -vv

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

# Install non-free media codecs, including AAC for high quality bluetooth audio.
# https://discussion.fedoraproject.org/t/how-to-enable-full-multimedia-support-on-fedora-41-h-265-e-ac-3-h-264-and-more/147586
sudo dnf5 install dnf5-plugins
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y
sudo dnf5 group install multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf5 group install sound-and-video
# Restart required to get codecs working.
