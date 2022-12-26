vim.g.mapleader = ' '
function quickfix_toggle()
  for idx=1,vim.fn.winnr("$") do
    if vim.fn.getwinvar(idx, '&syntax') == "qf" then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end

-- Tab completion
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

-- editor commands
local keyToCommands = {
  gl = require("telescope.builtin").diagnostics,
  gq = quickfix_toggle,
  ["<leader>"] = {
    -- Telescope
    ["<space>"] = require("telescope.builtin").builtin,
    p = require("telescope.builtin").find_files,
    bb = require("telescope.builtin").buffers,
    bs = require("telescope.builtin").current_buffer_fuzzy_find,
    fh = require("telescope.builtin").help_tags,
    ["/"] = require("telescope.builtin").live_grep,
    -- buffers and tabs
    ["]"] = "<cmd>bnext<cr>",
    ["["] = "<cmd>bprevious<cr>",
    [";"] = "<cmd>nohlsearch<cr>",
    ["."] = "<cmd>tabnext<cr>",
    [","] = "<cmd>tabprevious<cr>",
    -- file save and exits
    s = "<cmd>w<cr>",
    q = "<cmd>qa!<cr>",
    w = "<cmd>q<cr>",
    -- vmux
    rr = "<cmd>VimuxRunLastCommand<cr>",
    rs = "<cmd>VimuxInterruptRunner<cr>",
    -- some splits and windows
    ["\\"] = "<cmd>vsplit<cr>",
    ["-"] = "<cmd>split<cr>",
    -- Reload file
    fr = "<cmd>luafile ~/.config/nvim/init.lua<cr>",
    -- Neoterm
    ["0"]  = "<cmd>Tnext<cr>",
    ["9"]  = "<cmd>Tprevious<cr>",
    tr = "<cmd>T !!<cr>",
    ts = "<cmd>Tkill<cr>",
    tt = "<cmd>Ttoggle<cr>",
    te = "<cmd>T exit<cr>",
    tc = "<cmd>Tclear<cr>",
    -- NvimTree
    n = "<cmd>NvimTreeFindFileToggle<cr>",
  },
}
for topKey, val in pairs(keyToCommands) do
  if type(val) == "table" then
    for key, cmd in pairs(val) do
      vim.keymap.set("n", topKey..key, cmd)
    end
  else
    vim.keymap.set("n", topKey, val)
  end
end
