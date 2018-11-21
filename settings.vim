" This will be editor look and feel
:set number
:set lazyredraw
"Editor Functioning
set completeopt-=preview " disable preview window at the bottom of the screen
set clipboard=unnamedplus
filetype plugin indent on
set nocompatible
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set splitbelow
set autoread
set splitright
" completion
set noshowmode
" dont save modified buffers
set hidden
"mouse control
set mouse+=a
set background=dark
set termguicolors
" colorscheme base16-onedark
" colorscheme base16-oceanicnext
colorscheme base16-gruvbox-dark-pale
set cc=80
set laststatus=2
set visualbell
set inccommand=split
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
