" language server configuration
" make sure to install the cquery lang server -- easy with arch
"  --- requires the command_config.json file
"  --- install and use bear to generate the config files
" npm install -g javascript-typescript-langserver
" npm install -g typescript-language-server
" gem install solargraph
" pip install 'python-language-server[all]'
" go get -u github.com/sourcegraph/go-langserver
let g:LanguageClient_serverCommands = {
                  \ 'cpp': ['clangd'],
                  \ 'c': ['clangd'],
                  \ 'typescript': ['typescript-language-server', '--stdio'],
                  \ 'javascript': ['javascript-typescript-stdio'],
                  \ 'javascript.jsx': ['javascript-typescript-stdio'],
                  \ 'ruby': ['solargraph', 'stdio'],
                  \ 'python': ['pyls'],
                  \ 'go': ['go-langserver', '-gocodecompletion', '-func-snippet-enabled=false'],
                  \ }



" a worse alternative for c/++ is clangd
" make sure to install clangd
" \ 'cpp': ['cquery', '--log-file=/tmp/cq.log', '--init={"cacheDirectory":"/tmp/cquery", "completion": {"enableSnippets": false}}'],
" \ 'c': ['cquery', '--log-file=/tmp/cq.log', '--init={"cacheDirectory":"/tmp/cquery", "completion": {"enableSnippets": false}}'],
" \ 'cpp': ['clangd'],
" \ 'c': ['clangd'],


function LC_maps()
      if has_key(g:LanguageClient_serverCommands, &filetype)
            nnoremap  gh :call LanguageClient#textDocument_hover()<CR>
            nnoremap  gd :call LanguageClient#textDocument_definition()<CR>
            nnoremap  gr :call LanguageClient#textDocument_rename()<CR>
            nnoremap  gl :call LanguageClient#textDocument_documentSymbol()<CR>
            nnoremap <A-C-i> :call LanguageClient#textDocument_formatting()<cr>

            let g:LanguageClient_hasSnippetSupport=0
            let g:LanguageClient_diagnosticsList = "Location"
            let g:LanguageClient_useVirtualText=0
            set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
      else
            nnoremap <A-C-i> :Neoformat<cr>
      endif
endfunction

autocmd FileType * call LC_maps()

