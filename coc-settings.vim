" :CocInstall coc-dictionary
" :CocInstall coc-tag
" :CocInstall coc-emoji
" :CocInstall coc-snippets
" :CocInstall coc-highlight
" :CocInstall coc-python
" :CocInstall coc-rls
" :CocInstall coc-gocode
" :CocInstall coc-solargraph
" :CocInstall coc-java
" :CocInstall coc-html
" :CocInstall coc-tsserver
" :CocInstall coc-json
" Use `[c` and `]c` for navigate diagnostics
" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-rename)
nmap gl :CocList outline<cr>
nmap ge :CocList diagnostics<cr>

" documentation
nnoremap <silent>gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Snippets
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-l> for trigger snippet expand.
imap <A-i> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<A-i>'
let g:coc_snippet_prev = '<C-i>'
