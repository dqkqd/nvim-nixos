return {
  "snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    -- stylua: ignore start
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    -- stylua: ignore end
  },
  after = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      explorer = { enabled = true },
      picker = { enabled = true },
    })
  end,
}
