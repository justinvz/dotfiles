return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_float_style = "blend"

      -- The colorscheme has no transparency option for the completion menu.
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox-material",
        callback = function()
          for _, name in ipairs({ "Pmenu", "PmenuKind", "PmenuExtra", "PmenuSbar" }) do
            local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
            hl.bg, hl.ctermbg = nil, nil
            vim.api.nvim_set_hl(0, name, hl)
          end
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
