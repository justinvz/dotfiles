-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Harper appends to the spell file without recompiling it, so rebuild when it is stale.
local spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
if vim.fn.getftime(spellfile) > vim.fn.getftime(spellfile .. ".spl") then
  vim.cmd.mkspell({ args = { spellfile }, bang = true, mods = { silent = true } })
end
