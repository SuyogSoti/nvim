" This will be editor look and feel
" set relativenumber
" :set number
"Editor Functioning
" set completeopt-=preview " disable preview window at the bottom of the screen
" set completeopt=menuone,noselect
set completeopt=menuone,noinsert,noselect
" set clipboard=unnamedplus
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
set pumheight=10

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
let g:one_allow_italics = 1
" colorscheme base16-monokai
" colorscheme base16-onedark
" colorscheme base16-oceanicnext
colorscheme base16-gruvbox-dark-pale
" colorscheme base16-material
" colorscheme base16-railscasts
" colorscheme onedark

" color of non text characters
hi NonText guifg=bg

highlight SignifySignAdd guifg=#87ff5f ctermfg=119 guibg=None ctermbg=None gui=bold cterm=bold
highlight SignifySignDelete guifg=#df5f5f ctermfg=167 guibg=None ctermbg=None gui=bold cterm=bold
highlight SignifySignChange guifg=#ffff5f ctermfg=227 guibg=None ctermbg=None gui=bold cterm=bold
highlight clear SignColumn
hi VertSplit ctermbg=NONE guibg=NONE
set fillchars+=vert:│
" set cc=80
set laststatus=2
set visualbell

" python
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0


" Spell check in the markdown files
autocmd FileType markdown,tex setlocal spell
autocmd FileType ruby set shiftwidth=2

" To make sure I do not switch into the quicklist buffer
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

" If its neovim and not regular vim
set inccommand=split
aug fzf_setup
  au!
  au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
aug END
" Exit Terminal with a esc
:tnoremap <Esc> <C-\><C-n>
let g:neoterm_default_mod = "vertical"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" This is for the cursorline
 augroup CursorLine
   au!
   au VimEnter * setlocal cursorline
   au WinEnter * setlocal cursorline
   au BufWinEnter * setlocal cursorline
   au WinLeave * setlocal nocursorline
 augroup END

if has('conceal')
  set conceallevel=0
endif


" vim-signify
let g:signify_vcs_list = [ 'git' ]
set signcolumn=yes
set updatetime=100
let g:signify_sign_add               = '|'
let g:signify_sign_delete            = '|'
let g:signify_sign_change            = '|'
let g:signify_sign_change_delete     = '|'
let g:signify_sign_delete_first_line = '|'
let g:signify_priority = 1

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

