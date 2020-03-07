" " autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" Tab now selects the completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Keybindings!!!
let mapleader=" "
noremap <Leader>j <C-W><C-J>
noremap <Leader>k <C-W><C-K>
noremap <Leader>l <C-W><C-L>
noremap <Leader>h <C-W><C-H>

map <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>, :bnext<CR>
map <leader>. :bprevious<CR>
map <leader>m :nohlsearch<CR>
" Tab navigation like Firefox.
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>]   :tabnext<CR>
nnoremap <leader>t     :tabnew<CR>
noremap <leader>s :w<cr>
noremap <Leader>q :qa!<cr>
noremap <leader>w :q<cr>
noremap <C-p> :call fzf#vim#files('', fzf#vim#with_preview('right'))<cr>
noremap <leader>p :call fzf#vim#files('', fzf#vim#with_preview('right'))<cr>
noremap <Leader>bb :Buffers<cr>
noremap <Leader><space> :Commands<cr>
noremap <Leader>rr :VimuxRunLastCommand<cr>
noremap <Leader>rs :VimuxInterruptRunner<cr>
noremap <leader>\ :vsplit<cr>
noremap <leader>- :split<cr>
noremap <Leader>bs :BLines<cr>
noremap <Leader>/ :Rg<space>
nnoremap <silent> <Plug>window:quickfix:toggle :call <SID>QuickfixToggle()<CR>
nmap <Leader>tq <Plug>window:quickfix:toggle
nnoremap <silent> <Plug>window:locationlist:toggle :call <SID>LocationListToggle()<CR>
nmap <Leader>tl <Plug>window:locationlist:toggle
nnoremap <leader>ff :Neoformat<cr>
" Some custom terminal stuff
map <Leader>mm :wa<bar>15split term://make<space>
map <Leader>mt :wa<bar>15split term://make<CR>i
map <Leader>mb :wa<bar>:15split term://make build<CR>i
map <Leader>mb :wa<bar>:15split term://make build<CR>i
" Neoterm
nnoremap <leader>0 :Tnext<cr>
nnoremap <leader>9 :Tprevious<cr>
map <Leader>tt :Ttoggle<CR>
map <Leader>t1 :1Ttoggle<CR>
map <Leader>t2 :2Ttoggle<CR>
map <Leader>t3 :3Ttoggle<CR>
map <Leader>t4 :4Ttoggle<CR>
map <Leader>t5 :5Ttoggle<CR>
map <Leader>t6 :6Ttoggle<CR>

" Open NERDTree in the directory of the current file (or /home if no file is open)
nmap <leader>n :call NERDTreeToggleInCurDir()<cr>
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
map <C-e> <Plug>(easymotion-prefix)

" vim-comentary mappings
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine


" emmet
let g:user_emmet_leader_key='<C-e>'



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

fun! FilterName(name) "{{{
  return !(a:name =~? '^term://\.//....:/usr/bin/.*$')
endfunction "}}}


fun! s:ListFilteredBuffers()
  return filter(range(1, bufnr('$')), 'buflisted(v:val) && FilterName(bufname(v:val))')
endfunction

fun! GetNextBuffer()
  let bufferList = s:ListFilteredBuffers()
  let nextIndex = index(bufferList, bufnr('%')) + 1
  if nextIndex == len(bufferList)
    let nextIndex = 0
  endif
  nextIndex.buffer
endfunction

