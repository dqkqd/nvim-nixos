return {
  "multicursor.nvim",
  event = "BufEnter",
  after = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    -- stylua: ignore start
    vim.keymap.set({"n", "x"}, "<leader>l", function() mc.lineAddCursor(1) end, { desc = "Add cursor down" })
    vim.keymap.set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end, { desc = "Add match cursor down" })
    vim.keymap.set({"n", "x"}, "<leader>ma", function() mc.matchAllAddCursors() end, { desc = "Add match cursor down" })
    -- stylua: ignore end

    mc.addKeymapLayer(function(layerSet)
      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end,
}
