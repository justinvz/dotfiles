# My neovim setup

This setup is based on LazyVim. For now, only C++ is fully supported.

To get this to work, first install all the requirements for LazyVim: https://www.lazyvim.org/

⚡️ Requirements
- Neovim >= 0.11.2 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
- lazygit (optional)
- tree-sitter-cli and a C compiler for nvim-treesitter. See here
- curl for blink.cmp (completion engine)
- for fzf-lua (optional)
- fzf: fzf (v0.25.1 or greater)
- live grep: ripgrep
- find files: fd

Clone the repo: ```git clone https://gitlab.com/Goustang/neovim.git ~/.config/nvim```

Start with: ```nvim```

To the tmux config: ```ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf```
