return {
  "mfussenegger/nvim-dap",
  config = function()
    require("dapui").setup({
      expand_lines = false,
      element_mappings = {
        stacks = {
          open = "<CR>",
          expand = "o",
        },
      },
    })
  end,
}
