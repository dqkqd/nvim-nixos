return {
  "conform.nvim",
  event = "BufWritePre",
  after = function()
    require("conform").setup({

      formatters_by_ft = {
        nix = { "alejandra" },
        lua = { "stylua" },
        css = { "prettierd" },
        scss = { "prettierd" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
