# dotfiles
Dotfiles using GNU Stow.

```bash
apt install stow

git clone https://github.com/ben-hampson/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow . -vv
```

## tmux

Tmux plugins are kept as submodules.

(Maybe irrelevant now because they are submodules?) Once you have TPM cloned to `.config/tmux/plugins/tpm`, open `tmux`, hit the prefix (Ctrl-Space) and hit `I` to install the plugins.


## Submodules

`git submodule update --init --recursive` - Run this after every clone, pull, and checkout command to update the contents of submodule directories.
