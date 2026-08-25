# Neovim setup

This setup is based on LazyVim. For now, only C++ is fully supported.

To get this to work, first install all the requirements for LazyVim: [https://www.lazyvim.org/](https://www.lazyvim.org/)

## ⚡️ Requirements

* Neovim >= 0.11.2 (needs to be built with LuaJIT)
* Git >= 2.19.0 (for partial clones support)
* a Nerd Font (v3.0 or greater) (optional, but needed to display some icons)
* lazygit (optional)
* tree-sitter-cli and a C compiler for nvim-treesitter
* curl for blink.cmp (completion engine)

### for fzf-lua (optional)

* fzf: fzf (v0.25.1 or greater)
* live grep: ripgrep
* find files: fd

## Clone the repo

```bash
git clone https://gitlab.com/Goustang/neovim.git ~/.config/nvim
```

## Start Neovim

```bash
nvim
```

---

# tmux setup

tmux is a terminal multiplexer and can be used to split the terminal into several tabs, windows, and sessions.

This repo also includes my tmux configuration. You can create a symbolic link from the config in this repo to the `.tmux.conf` file inside your home directory.

Make sure you first install:

* tmux
* Tmux Plugin Manager (TPM)

---

## Tmux Plugin Manager

Install TPM with:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

---

## File link to tmux config

Create the symlink:

```bash
ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf
```

---

## Setup

Launch tmux by using:

```bash
tmux
```

The new prefix key is:

```text
Ctrl + a
```

To install all tmux plugins use:

```text
Ctrl + a + Shift + i
```

---

# workflow

I use tmux with persistent sessions so I can keep projects running in the background and reconnect later without losing my workspace.

---

## Create a new session

Start a new named session with:

```bash
tmux new -s myproject
```

Replace `myproject` with the name of your project.

Example:

```bash
tmux new -s cpp_project
```

This creates a new tmux session where you can open Neovim, terminals, builds, logs, and debugging tools.

---

## Detach from a session

To leave tmux while keeping everything running in the background:

```text
Ctrl + a, then press d
```

This detaches from the session and returns you to your normal shell.

---

## List existing sessions

To see all active tmux sessions:

```bash
tmux ls
```

This is useful when working on multiple projects at once.

---

## Reattach to a session

Reconnect to an existing session with:

```bash
tmux attach -t myproject
```

Example:

```bash
tmux attach -t cpp_project
```

Everything will be exactly where you left it.

---

## Kill a session

When a project is finished and you no longer need the session:

```bash
tmux kill-session -t myproject
```

---

## Typical workflow

A common workflow for me looks like this:

### 1. Start or attach to a project session

```bash
tmux attach -t cpp_project
```

or

```bash
tmux new -s cpp_project
```

---

### 2. Open Neovim in one pane

```bash
nvim
```

---

### 3. Use additional panes for

* building with CMake / Make
* running the executable
* viewing logs
* git operations
* debugging

This keeps the full development environment persistent and organized even after closing the terminal or disconnecting from a remote machine.
