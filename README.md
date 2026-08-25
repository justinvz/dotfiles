# Dotfiles

Personal Neovim, Zsh, and tmux configuration managed in one Git repository.

## Install

Install `git`, `zsh`, `tmux`, and `neovim`, then clone and run the installer:

```sh
git clone git@gitlab.com:Goustang/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

The installer creates these symbolic links:

```text
~/.config/nvim -> ~/dotfiles/nvim
~/.zshrc       -> ~/dotfiles/zsh/.zshrc
~/.p10k.zsh    -> ~/dotfiles/zsh/.p10k.zsh
~/.tmux.conf   -> ~/dotfiles/tmux/.tmux.conf
```

It also clones Oh My Zsh, Powerlevel10k, the configured Zsh plugins, and TPM
when they are missing. Existing unrelated files are never overwritten.

## Local settings

Machine-specific paths, credentials, and work aliases belong in
`~/.zshrc.local`, which is sourced by `.zshrc` but is not tracked. Use
`zsh/.zshrc.local.example` as a starting point.

Do not add shell histories, SSH keys, kubeconfigs, tokens, or other secrets to
this repository.

## Updating

```sh
git -C ~/dotfiles pull
~/dotfiles/install.sh
```

The previous Neovim documentation is available in `nvim/README.md`.
