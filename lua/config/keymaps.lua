-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set
local opts = { desc = "CMake", silent = true }

-- generate build system
map("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", vim.tbl_extend("force", opts, { desc = "CMake: Generate" }))

-- build
map("n", "<leader>cb", "<cmd>CMakeBuild<CR>", vim.tbl_extend("force", opts, { desc = "CMake: Build" }))

-- build & debug
map("n", "<leader>cd", "<cmd>CMakeDebug<CR>", vim.tbl_extend("force", opts, { desc = "CMake: Debug" }))

-- run last target (or default)
map("n", "<leader>cr", "<cmd>CMakeRun<CR>", vim.tbl_extend("force", opts, { desc = "CMake: Run" }))

-- pick a build type (Debug/Release)
map(
  "n",
  "<leader>ct",
  "<cmd>CMakeSelectBuildType<CR>",
  vim.tbl_extend("force", opts, { desc = "CMake: Select BuildType" })
)

-- pick a target to build/run
map(
  "n",
  "<leader>cx",
  "<cmd>CMakeSelectBuildTarget<CR>",
  vim.tbl_extend("force", opts, { desc = "CMake: Select Target" })
)
