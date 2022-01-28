lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
" completion
autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'Neosnippet'
let g:completion_enable_snippet = ''

" Autopaires
lua require('nvim-autopairs').setup()

" lspconfig
lua << EOF
local nvim_lsp = require('lspconfig')
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
    }
)
require'lspconfig'.pylsp.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.dartls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.tsserver.setup{}
EOF

" lualine
lua << EOF
require('lualine').setup{
  sections = {
    lualine_c = {
      {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    }
  }
}
EOF

lua << EOF
require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'gl', '<cmd>TroubleToggle<CR>', opts)
EOF

