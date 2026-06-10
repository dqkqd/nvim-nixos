return {
  "bufferline.nvim",
  after = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
      },
    })
  end,
}
