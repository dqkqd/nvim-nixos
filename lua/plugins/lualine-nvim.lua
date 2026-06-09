return {
  "lualine.nvim",
  after = function()
    require("lualine").setup({
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "progress" },
        lualine_y = { "location" },
        lualine_z = { "filetype" },
      },
    })
  end,
}
