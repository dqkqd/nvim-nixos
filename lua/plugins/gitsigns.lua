return {
  "gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },

  -- Dynamically check if the current directory is a git repository
  enabled = function()
    local git_dir = vim.fs.find(".git", {
      path = vim.fn.expand("%:p:h"),
      upward = true,
    })
    return #git_dir > 0
  end,
  after = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Prev Hunk")
      end,
      current_line_blame = true,
    })
  end,
}
