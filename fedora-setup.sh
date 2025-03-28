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

# Nvidia drivers
# This setup prevents problems with `systemctl suspend`
# Relevant for all GPUS under 'Current Nvidia GPUs' on https://download.nvidia.com/XFree86/Linux-x86_64/495.44/README/supportedchips.html
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda libva libva-nvidia-driver
# https://github.com/JaKooLit/Fedora-Hyprland/blob/main/install-scripts/nvidia.sh
# Additional options to add to GRUB_CMDLINE_LINUX
additional_options="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 nvidia_drm.fbdev=1"

# Check if additional options are already present in GRUB_CMDLINE_LINUX
if grep -q "GRUB_CMDLINE_LINUX.*$additional_options" /etc/default/grub; then
	echo "GRUB_CMDLINE_LINUX already contains the additional options" 2>&1 | tee -a "$LOG"
else
	# Append the additional options to GRUB_CMDLINE_LINUX
	sudo sed -i "s/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"$additional_options /" /etc/default/grub
    echo "Added the additional options to GRUB_CMDLINE_LINUX" 2>&1 | tee -a "$LOG"
fi

# Update GRUB configuration. Reboot required.
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

