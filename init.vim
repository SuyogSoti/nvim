" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" This will be to install all of the plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Dependencies
" For Gist is the one below
Plug 'mattn/webapi-vim'

" Snippets
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet'

" " Themes
Plug 'hoob3rt/lualine.nvim'
Plug 'chriskempson/base16-vim'

" Overall
Plug 'tpope/vim-commentary'
" Note: vim sound make it not change cursor when d is pressed
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'skywind3000/asyncrun.vim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-sleuth'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'tpope/vim-eunuch'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'

" searching?
Plug 'easymotion/vim-easymotion'
Plug 'wincent/ferret'


" Git Stuff
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'

" Languages
" HTML
Plug 'mattn/emmet-vim'

" File navigation
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'

" Tmux stuff
Plug 'benmills/vimux'

" Terminal stuff
Plug 'kassio/neoterm'

" Neovim 0.5 stuff
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'gfanto/fzf-lsp.nvim', {'branch': 'main'}
Plug 'nvim-lua/completion-nvim'
Plug 'windwp/nvim-autopairs'
Plug 'folke/trouble.nvim', {'branch': 'main'}
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" Initialize plugin system
call plug#end()

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg " | endif

"=================================================================================
"                       Other Files
"=================================================================================
source ~/.config/nvim/settings.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/snippets.vim
source ~/.config/nvim/neovim_five.vim
luafile ~/.config/nvim/filetree.lua
if filereadable(expand(("~/.config/nvim/google.vim")))
  source ~/.config/nvim/google.vim
endif
