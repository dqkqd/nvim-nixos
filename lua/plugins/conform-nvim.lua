return {
  "conform.nvim",
  event = "BufWritePre",
  after = function()
    local conform = require("conform")
    conform.setup({
      formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
            return false
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      formatters_by_ft = {
        ["*"] = { "trim_whitespace", "trim_newlines" },
        nix = { "alejandra" },
        lua = { "stylua" },
        css = { "prettierd" },
        scss = { "prettierd" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt" },
        json = { "prettierd" },
        ["markdown"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettierd", "markdownlint-cli2", "markdown-toc" },
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
