return {
  "lazydev.nvim",
  cmd = "LazyDev",
  ft = "lua",
  after = function()
    require("lazydev").setup({})
  end,
}
