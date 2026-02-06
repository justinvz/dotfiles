return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    -- Remove the clock from the rightmost section
    if opts.statusline and opts.statusline[3] then
      opts.statusline[3] = vim.tbl_filter(function(c)
        return c.provider ~= " %H:%M" -- or just remove all time providers
      end, opts.statusline[3])
    end
  end,
}
