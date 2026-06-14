return {
  "bufferline.nvim",
  after = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        ---@param buf {name: string, path: string, bufnr: integer}
        name_formatter = function(buf)
          local name = buf.name
          if vim.bo[buf.bufnr].readonly then
            return "󰌾 " .. name
          end
          return name
        end,
      },
    })
  end,
}
