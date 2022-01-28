require'nvim-tree'.setup {
  view = {
    width = 50,
  },
}
-- MyNvimTreeToggle()
function MyNvimTreeToggle()
  local treeBufName = "NvimTree"
  if vim.fn.exists(treeBufName) and vim.fn.bufwinnr(treeBufName) ~= -1 then
    vim.api.nvim_command("NvimTreeToggle")
  elseif vim.fn.expand("%") == '' then
    vim.api.nvim_command("NvimTreeToggle")
  else
    vim.api.nvim_command("NvimTreeFindFile")
  end
end

-- Key Maps
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>lua MyNvimTreeToggle()<CR>', {noremap = true})
