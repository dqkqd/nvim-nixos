return {
  "catppuccin-nvim",
  priority = 1000,
  lazy = false,
  after = function()
    require("catppuccin").setup({
      flavour = "mocha",
      highlight_overrides = {
        mocha = function(mocha)
          return {
            LineNr = { fg = mocha.text },
          }
        end,
      },
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
