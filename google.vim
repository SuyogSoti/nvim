luafile ~/.config/nvim/lua/helper_funcs.lua
luafile ~/.config/nvim/google.lua
source /usr/share/vim/google/glug/bootstrap.vim

Glug codefmt
Glug codefmt-google
Glug csearch
Glug fzf-query
Glug google-filetypes
Glug corpweb
Glug blazedeps plugin[mappings]='<Leader>v'
Glug relatedfiles plugin[mappings]='<Leader>r'
" augroup autoformat_settings
"   autocmd FileType borg,gcl,patchpanel AutoFormatBuffer gclfmt
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,javascript AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType jslayout AutoFormatBuffer jslfmt
"   autocmd FileType markdown AutoFormatBuffer mdformat
"   autocmd FileType ncl AutoFormatBuffer nclfmt
"   autocmd FileType python AutoFormatBuffer pyformat
"   autocmd FileType textpb AutoFormatBuffer text-proto-format
"   autocmd FileType proto AutoFormatBuffer protofmt
"   autocmd FileType sql AutoFormatBuffer format_sql
"   autocmd FileType html,css,json AutoFormatBuffer js-beautify
" augroup END


nnoremap <leader>1 :FzfCsBuffer google/api/<cr>
nnoremap <leader>2 :FzfCsBuffer java/com/google/api/<cr>
nnoremap <leader>3 :FzfCsBuffer apiserving/<cr>
nnoremap <leader>4 :FzfCsBuffer javatests/com/google/api/<cr>

lua << EOF
-- Add a CiderLSP configuration.
if inCitc() then
local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')
configs.ciderlsp = {
 default_config = {
   cmd = {'/google/bin/releases/cider/ciderlsp/ciderlsp', '--tooltag=nvim-lsp' , '--noforward_sync_responses'};
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

    vim.api.nvim_command("augroup LSP")
    vim.api.nvim_command("autocmd!")
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_command("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
      vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
      vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
    end
    vim.api.nvim_command("augroup END")
  end
}
end
EOF


if luaeval("inCitc()")
  nnoremap <leader>ff :FormatCode<cr>
  command! -bang NewFiles call fzf#run(fzf#wrap({ 'source': 'fdfind . java/com/google/api javatests/com/google/api apiserving google/api', 'sink': 'e'}, <bang>0))
  command! -bang NewFiles call fzf#run(fzf#wrap({ 'source': 'fdfind . java/com/google/api javatests/com/google/api apiserving google/api', 'sink': 'e'}, <bang>0))
  noremap <leader>p :NewFiles<cr>
endif
