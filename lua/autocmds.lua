local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.filetype.add({
  extension = {
    slt = "sqllogictest",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "sqllogictest",
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Mark files outside cwd as readonly",
  callback = function(ev)
    local fname = vim.api.nvim_buf_get_name(ev.buf)
    if fname == "" then
      return
    end

    local cwd = vim.uv.cwd()
    if cwd and not vim.startswith(fname, cwd) then
      vim.bo[ev.buf].readonly = true
      vim.bo[ev.buf].modifiable = false
    end
  end,
})
