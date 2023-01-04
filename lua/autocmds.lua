-- I don't want to cycle through the quickfix list when I cycle buffers.
local qfBufNoList = vim.api.nvim_create_augroup("QuickfixNoBuflisted", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.bo.buflisted = false
  end,
  group = qfBufNoList,
});

-- I want cursorline only on the window I am on
local cursorline = vim.api.nvim_create_augroup("Cursorline", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter" }, {
  callback = function()
    vim.wo.cursorline = true
  end,
  group = cursorline,
})
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    vim.wo.cursorline = false
  end,
  group = cursorline,
})
