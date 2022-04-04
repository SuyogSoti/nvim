require("helper_funcs")

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
-- Mappings.
local opts = { noremap=true, silent=true }
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ga', '<cmd>CodeActions<CR>', opts)
vim.api.nvim_set_keymap('n', 'gs', '<cmd>DocumentSymbols<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
vim.api.nvim_set_keymap('n', 'ge', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false
})

if not inCitc() then
  require("nvim-lsp-installer").on_server_ready(function(server)
    server:setup({})
  end)
end

