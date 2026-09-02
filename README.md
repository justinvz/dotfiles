# Dotfiles

Personal Neovim, Zsh, tmux, and Sesh configuration.

## Install

Install `git`, `zsh`, `tmux`, `neovim`, `sesh`, and `zoxide`, then run:

```sh
git clone git@github.com:justinvz/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

## Workflow

Run `tmux` to select a project. Inside tmux, use `Alt-o` to switch projects.

```text
Ctrl-a |       split horizontally
Ctrl-a -       split vertically
Ctrl-h/j/k/l   navigate panes and Neovim
Ctrl-a H/J/K/L resize panes
Ctrl-a d       detach
Alt-n/p        switch windows
```

Projects under `~/work_git`, `~/workspace`, and `~/school` are added to zoxide
by the installer. Sessions survive detaching but are not restored after reboot.

## Local settings

Put machine-specific settings and secrets in `~/.zshrc.local`.

## Updating

```sh
git -C ~/dotfiles pull
~/dotfiles/install.sh
```
