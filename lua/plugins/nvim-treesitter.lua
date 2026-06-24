return {
  "nvim-treesitter",
  lazy = false,
  after = function()
    -- Enable treesitter
    local installable_parsers = require("nvim-treesitter").get_available()
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("enable_treesitter", { clear = true }),
      callback = function(e)
        local buf, filetype = e.buf, e.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end
        if not vim.tbl_contains(installable_parsers, language) then
          return
        end
        vim.treesitter.start(buf, language)
      end,
    })
  end,
}
