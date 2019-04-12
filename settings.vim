" This will be editor look and feel
" set relativenumber
:set number
"Editor Functioning
set completeopt-=preview " disable preview window at the bottom of the screen
set clipboard=unnamedplus
filetype plugin indent on
set nocompatible
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set ignorecase
set smartcase
set autoindent
set splitbelow

" reload the file from the buffer automatically
set autoread
au FocusGained,BufEnter * :checktime

set splitright
" completion
set noshowmode
" dont save modified buffers
set hidden
"mouse control
set mouse+=a
set background=dark
set termguicolors
" colorscheme base16-monokai
" colorscheme base16-onedark
" colorscheme base16-oceanicnext
" colorscheme base16-gruvbox-dark-pale
" colorscheme base16-material
colorscheme OceanicNext

" color of non text characters
hi NonText guifg=bg
highlight SignColumn ctermfg=NONE gui=NONE cterm=NONE

highlight DiffAdd guifg=#87ff5f ctermfg=119 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight DiffDelete guifg=#df5f5f ctermfg=167 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight DiffChange guifg=#ffff5f ctermfg=227 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
highlight DiffText guifg=#ff5f5f ctermfg=203 guibg=#5f0000 ctermbg=52 gui=bold cterm=bold
" set cc=80
set laststatus=2
set visualbell
" Spell check in the markdown files
autocmd FileType markdown,tex setlocal spell
autocmd FileType ruby set shiftwidth=2

" To make sure I do not switch into the quicklist buffer
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

" Where are my python binaries
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


" If its neovim and not regular vim
if has('nvim')
  set inccommand=split
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
  " Exit Terminal with a esc
  :tnoremap <Esc> <C-\><C-n>
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end
"This is for the cursorline
" augroup CursorLine
"   au!
"   au VimEnter * setlocal cursorline
"   au WinEnter * setlocal cursorline
"   au BufWinEnter * setlocal cursorline
"   au WinLeave * setlocal nocursorline
" augroup END
