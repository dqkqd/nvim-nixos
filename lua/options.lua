vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.clipboard = "unnamedplus" -- allow system clipboard
opt.completeopt = "menu,menuone,noselect" -- Set completeopt to have a better completion experience
opt.expandtab = true -- Use spaces instead of tabs
opt.hlsearch = true -- Set highlight on search
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- Preview substitutions live, as you type!
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor.
opt.shiftwidth = 2 -- Size of an indent
opt.signcolumn = "yes" -- Keep signcolumn on by default
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true -- Save undo history
opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- [[ Diagnostic ]]
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
  },
  signs = true,
  underline = true,
})
