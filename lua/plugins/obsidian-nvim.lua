local notes_path = vim.fn.expand("~/ws/notes")

return {
  "obsidian.nvim",
  event = {
    "BufReadPre " .. notes_path .. "/*.md",
    "BufNewFile " .. notes_path .. "/*.md",
  },
  after = function()
    require("obsidian").setup({
      legacy_commands = false, -- this will be removed in 4.0.0
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      picker = {
        ---@diagnostic disable-next-line: assign-type-mismatch
        name = "snacks.picker",
      },
      workspaces = {
        {
          name = "personal",
          path = notes_path,
        },
      },
    })

    -- do not mix up marksman
    vim.lsp.enable("marksman", false)
  end,
}
