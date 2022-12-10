luafile ~/.config/nvim/lua/helper_funcs.lua
luafile ~/.config/nvim/google.lua

lua << EOF
-- Add a CiderLSP configuration.
if inCitc() then
local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')
configs.ciderlsp = {
 default_config = {
   cmd = {'ssh', 'suyog.c.googlers.com', '/google/bin/releases/cider/ciderlsp/ciderlsp', '--tooltag=nvim-lsp' , '--noforward_sync_responses'};
   filetypes = {'c', 'cpp', 'java', 'proto', 'textproto', 'go', 'python', 'bzl'};
   root_dir = nvim_lsp.util.root_pattern('BUILD');
   settings = {};
 }
}

-- Setup CiderLSP.
nvim_lsp.ciderlsp.setup{
  on_attach = function(client, bufnr)
    -- Omni-completion via LSP. See `:help compl-omni`. Use <C-x><C-o> in
    -- insert mode. Or use an external autocompleter (see below) for a
    -- smoother UX.
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    if vim.lsp.formatexpr then -- Neovim v0.6.0+ only.
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")
    end
    if vim.lsp.tagfunc then -- Neovim v0.6.0+ only.
      -- Tag functionality via LSP. See `:help tag-commands`. Use <c-]> to
      -- go-to-definition.
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end
  end
}
end
EOF


if luaeval("inCitc()")
  command! -bang NewFiles call fzf#run(fzf#wrap({ 'source': 'pfind -type f java/com/google/api javatests/com/google/api apiserving google/api', 'sink': 'e'}, <bang>0))
  command! -bang NewFiles call fzf#run(fzf#wrap({ 'source': 'pfind -type f java/com/google/api javatests/com/google/api apiserving google/api', 'sink': 'e'}, <bang>0))
  noremap <leader>p :NewFiles<cr>
endif
