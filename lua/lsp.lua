require("helper_funcs")

-- Mappings.
local opts = { noremap = true, silent = true }
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gs', require("telescope.builtin").lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false
})

if not inCitc() then
  require("nvim-lsp-installer").on_server_ready(function(server)
    server:setup({})
  end)
end
