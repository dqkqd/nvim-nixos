return {
  "oil.nvim",
  after = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
