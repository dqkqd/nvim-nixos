vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- allow system clipboard
vim.o.clipboard = "unnamedplus"

-- allow .nvim.lua in current dir and parents (project config)
vim.o.exrc = false -- can be toggled off in that file to stop it from searching further

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Set highlight on search
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Indent
vim.o.smarttab = true
vim.opt.cpoptions:append("I")
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- stops line wrapping from being confusing
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
vim.wo.relativenumber = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,preview,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Disable auto comment on enter ]]
-- See :help formatoptions
vim.api.nvim_create_autocmd("FileType", {
  desc = "remove formatoptions",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

-- [[ Diagnostic ]]
vim.diagnostic.config({
  virtual_text = {
    -- prefix = '●',  -- or '■', '▎', '✖' etc
    spacing = 4,
  },
  signs = true,
  underline = true,
})

-- [[ Basic Keymaps ]]
-- luacheck: push ignore
-- stylua: ignore start
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves Line Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves Line Up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous Search Result" })

vim.keymap.set("n", "<leader><leader>[", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader><leader>]", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader><leader>l", "<cmd>b#<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader><leader>d", "<cmd>bdelete<CR>", { desc = "delete buffer" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set({ "v", "x", "n" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>Y", '"+yy', { noremap = true, silent = true, desc = "Yank line to clipboard" })
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set("i", "<C-p>", "<C-r><C-p>+", { noremap = true, silent = true, desc = "Paste from clipboard from within insert mode" })
vim.keymap.set("x", "<leader>P", '"_dP', { noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Tabs
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete Buffers to the Right" })
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete Buffers to the Left" })
vim.keymap.set("n", "<leader>ba", "<cmd>BufferLineCloseOthers<cr>", { desc = "Delete other Buffers" })
vim.keymap.set("n", "<leader>[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to buffer 1" })
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to buffer 2" })
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to buffer 3" })
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to buffer 4" })
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to buffer 5" })
vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to buffer 6" })
vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to buffer 7" })
vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to buffer 8" })
vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to buffer 9" })

-- copy relative path
vim.keymap.set('n', '<leader>cp', function() vim.fn.setreg('+', vim.fn.expand('%:.')) end, { desc = 'Copy relative path' })

-- stylua: ignore end
-- luacheck: pop
