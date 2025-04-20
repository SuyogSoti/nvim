require("helper_funcs")

vim.g.mapleader = ' '

-- toggle quickfix list
local function quickfix_toggle()
  for idx = 1, vim.fn.winnr("$") do
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
  gl = "<cmd>TroubleToggle document_diagnostics<cr>",
  gq = quickfix_toggle,
  ["<leader>"] = {
    -- buffers and tabs
    ["]"]       = "<cmd>bnext<cr>",
    ["["]       = "<cmd>bprevious<cr>",
    [";"]       = "<cmd>nohlsearch<cr>",
    ["."]       = "<cmd>tabnext<cr>",
    [","]       = "<cmd>tabprevious<cr>",
    -- file save and exits
    s           = "<cmd>update<cr>",
    q           = "<cmd>qa!<cr>",
    w           = "<cmd>q<cr>",
    -- vmux
    rr          = "<cmd>VimuxRunLastCommand<cr>",
    rs          = "<cmd>VimuxInterruptRunner<cr>",
    -- some splits and windows
    ["\\"]      = "<cmd>vsplit<cr>",
    ["-"]       = "<cmd>split<cr>",
    -- Reload file
    fr          = "<cmd>luafile ~/.config/nvim/init.lua<cr>",
    -- Neoterm
    ["0"]       = "<cmd>Tnext<cr>",
    ["9"]       = "<cmd>Tprevious<cr>",
    tr          = "<cmd>T !!<cr>",
    ts          = "<cmd>Tkill<cr>",
    tt          = "<cmd>Ttoggle<cr>",
    te          = "<cmd>T exit<cr>",
    tc          = "<cmd>Tclear<cr>",
  },
}

-- setKeyMaps recursively sets the key maps from the table given
local function setKeyMaps(table, prefix)
  for topKey, val in pairs(table) do
    if type(val) == "table" then
      setKeyMaps(val, prefix .. topKey)
    else
      vim.keymap.set("n", prefix .. topKey, val)
    end
  end
end

setKeyMaps(keyToCommands, "")
