" snippets
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-m>     <Plug>(neosnippet_expand_or_jump)
smap <C-m>     <Plug>(neosnippet_expand_or_jump)
xmap <C-m>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-m>     <Plug>(neosnippet_expand_or_jump)

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/.nvim/plugged/vim-snippets/snippets'

