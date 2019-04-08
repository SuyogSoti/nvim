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
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" " Themes
" Plug 'itchyny/lightline.vim'
" Plug 'mgee/lightline-bufferline'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Overall
Plug 'tpope/vim-commentary'
" Note: vim sound make it not change cursor when d is pressed
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'skywind3000/asyncrun.vim'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'tpope/vim-eunuch'
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'

" searching?
Plug 'easymotion/vim-easymotion'
Plug 'wincent/ferret'


" Autocompletion
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" " has weird cursor behavior
" Plug 'ncm2/ncm2'
" " ncm2 requires nvim-yarp
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-path'

" Git Stuff
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Languages
" HTML
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-python/python-syntax'

" ruby/ruby on rails
Plug 'tpope/vim-rails'

" Coffee Script
Plug 'kchmck/vim-coffee-script'

"R
Plug 'jalvesaq/Nvim-R'

" File navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'

" Tmux stuff
Plug 'benmills/vimux'

" Terminal stuff
Plug 'kassio/neoterm'

" Initialize plugin system
call plug#end()



" This is an alternate for the completion manager
" source ~/.config/nvim/ncm2.vim

" This is an alternate for useing lightline
" source ~/.config/nvim/lightline.vim

source ~/.config/nvim/airline.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/deoplete.vim
source ~/.config/nvim/languageClient.vim
source ~/.config/nvim/snippets.vim
source ~/.config/nvim/general.vim
