return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.clangd = opts.servers.clangd or {}

      local cmd = opts.servers.clangd.cmd or { "clangd" }
      if not vim.tbl_contains(cmd, "--log=error") then
        table.insert(cmd, "--log=error")
      end
      opts.servers.clangd.cmd = cmd
    end,
  },
}
