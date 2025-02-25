# dotfiles
Dotfiles using GNU Stow.

```bash
apt install stow

git clone https://github.com/ben-hampson/dotfiles.git ~/.config
cd ~/.config/dotfiles
stow . -vv
```

## tmux

You just need the TPM module, and then TPM will install all the other plugins listed in `tmux.conf`

Once you have TPM cloned to `.config/tmux/plugins/tpm`, open `tmux`, hit the prefix (Ctrl-Space) and hit `I` to install the plugins.
