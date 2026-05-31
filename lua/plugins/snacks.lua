return {
  "snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    -- stylua: ignore start
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    -- stylua: ignore end
  },
  after = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      picker = { enabled = true },
    })
  end,
}
