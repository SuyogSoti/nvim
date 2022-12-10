require("helper_funcs")
require("plugins")
require('completion')
vim.cmd("source ~/.config/nvim/settings.vim")
vim.cmd("source ~/.config/nvim/keymaps.vim")
require('keymaps')
if inCitc() then
  require('google')
end
require('lsp')
