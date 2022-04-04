require("helper_funcs")
require("plugins")
require('lsp')
require('completion')

vim.cmd("source ~/.config/nvim/settings.vim")
vim.cmd("source ~/.config/nvim/keymaps.vim")
if inCitc() then
  vim.cmd("source ~/.config/nvim/google.vim")
end
