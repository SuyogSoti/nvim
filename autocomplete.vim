" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" deplete stuff
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_start_length = 1
" call deoplete#custom#option({
"       \ 'auto_complete_delay': 1,
"       \ })
