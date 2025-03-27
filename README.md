# dotfiles
Dotfiles using GNU Stow.

## Setup
```sh
git clone https://github.com/ben-hampson/dotfiles.git ~/dotfiles
cd ~/dotfiles
./mac-setup.sh
# or
./fedora-setup.sh
```

## tmux

Tmux plugins are kept as submodules.

(Maybe irrelevant now because they are submodules?) Once you have TPM cloned to `.config/tmux/plugins/tpm`, open `tmux`, hit the prefix (Ctrl-Space) and hit `I` to install the plugins.


## Submodules

Run this after every clone, pull, and checkout command to update the contents of submodule directories:
```sh
git submodule update --init --recursive
```

To update the submodule commit to the remote repo's latest commit, `cd` into that dir and run `git pull origin master`.

To update the submodule commit of all the submodules, `cd ~/dotfiles && git submodule foreach git pull`
