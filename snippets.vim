" snippets
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <A-i>     <Plug>(neosnippet_expand_or_jump)
smap <A-i>     <Plug>(neosnippet_expand_or_jump)
xmap <A-i>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <A-i>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
  let g:vim_markdown_conceal = 0
  let g:tex_conceal = ""
  let g:vim_markdown_math = 1
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/.nvim/plugged/vim-snippets/snippets'

