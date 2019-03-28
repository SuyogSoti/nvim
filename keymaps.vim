" " autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" Tab now selects the completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Keybindings!!!
let mapleader=" "
noremap <A-l> <C-W><C-L>
noremap <A-h> <C-W><C-H>
noremap <A-j> <C-W><C-J>
noremap <A-k> <C-W><C-K>
noremap <Leader>wj <C-W><C-J>
noremap <Leader>wk <C-W><C-K>
noremap <Leader>wl <C-W><C-L>
noremap <Leader>wh <C-W><C-H>

map <A-d> :bp<bar>sp<bar>bn<bar>bd<CR>
map <A-]> :bnext<CR>
map <A-[> :bprevious<CR>
map <A-m> :nohlsearch<CR>
map <Leader>mm :wa<bar>15split term://make<space>
map <Leader>mt :wa<bar>15split term://make<CR>i
map <Leader>mb :wa<bar>:15split term://make build<CR>i
map <Leader>st :wa<bar>15split<bar>terminal<CR>
map <Leader>vt :wa<bar>:80vsplit<bar>terminal<CR>
inoremap <A-s> <esc>:w<cr>                 " save files
noremap <A-s> :w<cr>
noremap <Leader>fs :w<cr>
inoremap <A-a> <esc>:wq!<cr>               " save and exit
noremap <A-a> :wq!<cr>
noremap <Leader>qq <esc>:qa!<cr>               " quit discarding changes
noremap <Leader>qq :qa!<cr>
noremap <A-q> <esc>:qa!<cr>               " quit discarding changes
noremap <A-q> :qa!<cr>
inoremap <A-w> <esc>:q<cr>               " quit discarding changes
noremap <A-w> :q<cr>
noremap <A-p> :call fzf#vim#files('', fzf#vim#with_preview('right'))<cr>
noremap <Leader>bb :Buffers<cr>
noremap <A-C-p> :Tags<cr>
noremap <Leader>pt :Tags<cr>
noremap <Leader><space> :Commands<cr>
noremap <Leader>sf :BLines<cr>
noremap <Leader>sb :Lines<cr>
noremap <Leader>w\ :vsplit<cr>
noremap <Leader>w- :split<cr>
noremap <Leader>rr :VimuxRunLastCommand<cr>
noremap <Leader>rs :VimuxInterruptRunner<cr>
noremap <A-\> :vsplit<cr>
noremap <A--> :split<cr>
noremap <Leader>sp :Ack<space>
nnoremap <silent> <Plug>window:quickfix:toggle :call <SID>QuickfixToggle()<CR>
nmap <Leader>tq <Plug>window:quickfix:toggle
nnoremap <silent> <Plug>window:locationlist:toggle :call <SID>LocationListToggle()<CR>
nmap <Leader>tl <Plug>window:locationlist:toggle
nmap <A-C-i> :Neoformat<cr>

" Open NERDTree in the directory of the current file (or /home if no file is open)
map <Leader>tt :call NERDTreeToggleInCurDir()<cr>
nmap <A-n> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if bufname('%') == ''
      exe ":NERDTreeToggle"
    else
      exe ":NERDTreeFind"
    endif
  endif
endfunction

" vim easymotion
map <Leader>e <Plug>(easymotion-prefix)

" vim-comentary mappings
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine


" emmet
let g:user_emmet_leader_key='<A-e>'



" toggle quicklist and stuff
if exists("g:__QUICKFIX_TOGGLE_jfklds__")
  finish
endif
let g:__QUICKFIX_TOGGLE_jfklds__ = 1

fun! s:QuickfixToggle() "{{{

  let nr = winnr("$")
  cwindow
  let nr2 = winnr("$")
  if nr == nr2
    cclose
  endif

endfunction "}}}

fun! s:LocationListToggle() "{{{

  let nr = winnr("$")
  lwindow
  let nr2 = winnr("$")
  if nr == nr2
    lclose
  endif

endfunction "}}}


