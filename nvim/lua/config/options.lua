-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

vim.opt.spell = false
vim.opt.spelllang = { "en_us" }
vim.opt.spelloptions:append("camel")
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
