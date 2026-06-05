local set = vim.keymap.set


-- luacheck: push ignore
-- stylua: ignore start
set("n", "<Esc>", "<cmd>nohlsearch<CR>")
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves Line Down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves Line Up" })
set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
set("n", "n", "nzzzv", { desc = "Next Search Result" })
set("n", "N", "Nzzzv", { desc = "Previous Search Result" })

set("n", "<leader><leader>[", "<cmd>bprev<CR>", { desc = "Previous buffer" })
set("n", "<leader><leader>]", "<cmd>bnext<CR>", { desc = "Next buffer" })
set("n", "<leader><leader>l", "<cmd>b#<CR>", { desc = "Last buffer" })
set("n", "<leader><leader>d", "<cmd>bdelete<CR>", { desc = "delete buffer" })

-- Remap for dealing with word wrap
set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

set({ "v", "x", "n" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
set({ "n", "v", "x" }, "<leader>Y", '"+yy', { noremap = true, silent = true, desc = "Yank line to clipboard" })
set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
set("i", "<C-p>", "<C-r><C-p>+", { noremap = true, silent = true, desc = "Paste from clipboard from within insert mode" })
set("x", "<leader>P", '"_dP', { noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" })
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Tabs
set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete Buffers to the Right" })
set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "Delete Buffers to the Left" })
set("n", "<leader>ba", "<cmd>BufferLineCloseOthers<cr>", { desc = "Delete other Buffers" })
set("n", "<leader>[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
set("n", "<leader>]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to buffer 1" })
set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to buffer 2" })
set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to buffer 3" })
set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to buffer 4" })
set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to buffer 5" })
set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to buffer 6" })
set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to buffer 7" })
set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to buffer 8" })
set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to buffer 9" })

-- copy relative path
set('n', '<leader>cp', function() vim.fn.setreg('+', vim.fn.expand('%:.')) end, { desc = 'Copy relative path' })

-- stylua: ignore end
-- luacheck: pop
