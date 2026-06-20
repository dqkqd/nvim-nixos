return {
  "markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  ft = { "markdown" },
  before = function()
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_browser = "" -- uses system default browser
  end,
}
