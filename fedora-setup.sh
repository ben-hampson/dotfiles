#!/usr/bin/env bash

sudo dnf install -y \
  speedtest-cli \
  btop \
  espanso-wayland \
  fzf \
  1password \ # needs repos 
  translate-shell

brew install \
  argocd \
  openshift-cli

curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
