return {
  "conform.nvim",
  event = "BufWritePre",
  after = function()
    local conform = require("conform")
    conform.setup({

      formatters_by_ft = {
        ["*"] = { "trim_whitespace", "trim_newlines" },
        nix = { "alejandra" },
        lua = { "stylua" },
        css = { "prettierd" },
        scss = { "prettierd" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "never",
      },
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      conform.format({ async = true, lsp_format = "never", range = range })
    end, { range = true })
  end,
}
