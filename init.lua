require("helper_funcs")
require("plugins")
require('completion')
vim.cmd("source ~/.config/nvim/settings.vim")
vim.cmd("source ~/.config/nvim/keymaps.vim")
require('keymaps')
if inCitc() then
  vim.cmd("source ~/.config/nvim/google.vim")
end
require('lsp')
