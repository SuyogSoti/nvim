" Don't Install coc-syntax as that shite is slow!!!....
" :CocInstall coc-dictionary
" :CocInstall coc-tag
" :CocInstall coc-emoji
" :CocInstall coc-highlight
" :CocInstall coc-python
" :CocInstall coc-rls
" :CocInstall coc-gocode
" :CocInstall coc-solargraph
" :CocInstall coc-java
" :CocInstall coc-html
" :CocInstall coc-tsserver
" :CocInstall coc-json
" :CocInstall coc-pairs
" :CocInstall coc-phpls
" :CocInstall coc-clangd
" Use `[c` and `]c` for navigate diagnostics
" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=1000

autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-rename)
nmap gl :CocList outline<cr>
nmap ge :CocList diagnostics<cr>
nmap ga :CocAction<cr>

" documentation
nnoremap <silent>gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"
" coc extensions
let g:coc_global_extensions = ['coc-dictionary', 'coc-emoji', 'coc-highlight', 'coc-pairs']
