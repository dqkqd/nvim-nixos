return {
  "blink.cmp",
  after = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "omni" },
      },
      signature = { enabled = true },
      completion = {
        ghost_text = {
          enabled = true,
        },
      },
    })
  end,
}
