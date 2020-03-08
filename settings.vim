" This will be editor look and feel
" set relativenumber
" :set number
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
" colorscheme gruvbox
colorscheme OceanicNext
" colorscheme new-railscasts

" color of non text characters
hi NonText guifg=bg

highlight SignifySignAdd guifg=#87ff5f ctermfg=119 guibg=None ctermbg=None gui=bold cterm=bold
highlight SignifySignDelete guifg=#df5f5f ctermfg=167 guibg=None ctermbg=None gui=bold cterm=bold
highlight SignifySignChange guifg=#ffff5f ctermfg=227 guibg=None ctermbg=None gui=bold cterm=bold
highlight clear SignColumn
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

" If its neovim and not regular vim
if has('nvim')
  set inccommand=split
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
  " Exit Terminal with a esc
  :tnoremap <Esc> <C-\><C-n>
  let g:neoterm_default_mod = "vertical"
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end

" This is for the cursorline
 augroup CursorLine
   au!
   au VimEnter * setlocal cursorline
   au WinEnter * setlocal cursorline
   au BufWinEnter * setlocal cursorline
   au WinLeave * setlocal nocursorline
 augroup END

if has('conceal')
  set conceallevel=2 concealcursor=niv
  let g:vim_markdown_conceal = 0
  let g:tex_conceal = ""
  let g:vim_markdown_math = 1
endif
