return {
  "nvim-lint",
  event = { "BufWritePost", "BufReadPost" },
  after = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      nix = { "statix", "deadnix" },
      lua = { "luacheck" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
