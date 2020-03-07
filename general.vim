" NerdTree
let NERDTreeShowHidden=1

" gist
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1

set pumheight=10


" python
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0


" " fold functions
" set foldmethod=syntax
" set foldnestmax=1
" let g:php_folding = 1
" let g:javaScript_fold = 1
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1

" Autogenerate tags
" let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

let g:polyglot_disabled = ['python']
let g:polyglot_disabled = ['latex']

nnoremap <C-U> 5<C-y>
nnoremap <C-D> 5<C-e>

let g:echodoc#enable_at_startup=1

"github dashboard
let g:github_dashboard = { 'username': $GITHUB_USER, 'password': $GITHUB_TOKEN }
let g:github_dashboard['emoji'] = 1

" vim-signify
let g:signify_vcs_list = [ 'git' ]
set signcolumn=yes
let g:signify_sign_add               = '|'
let g:signify_sign_delete            = '|'
let g:signify_sign_change            = '|'
let g:signify_sign_change_delete     = '|'
let g:signify_sign_delete_first_line = '|'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']



