" Keybindings!!!
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
nnoremap <C-U> 5<C-y>
nnoremap <C-D> 5<C-e>
noremap <Leader>j <C-W><C-J>
noremap <Leader>k <C-W><C-K>
noremap <Leader>l <C-W><C-L>
noremap <Leader>h <C-W><C-H>

map <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

" vim-comentary mappings
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine

" emmet
let g:user_emmet_leader_key='<C-,>'
