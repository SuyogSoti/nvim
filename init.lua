require("helper_funcs")
require("config.settings")
require("config.lazy")
vim.cmd("source ~/.config/nvim/settings.vim")
vim.cmd("source ~/.config/nvim/keymaps.vim")
require('keymaps')
if inCitc() then
  require('google')
end
require('autocmds')
