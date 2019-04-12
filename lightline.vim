function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" lightline config
let g:lightline = {
      \   'colorscheme': 'Tomorrow_Night_Eighties',
      \   'active': {
      \     'left':[ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \              [ 'cocstatus', 'readonly','currentfunction']
      \     ]
      \   },
      \   'component': {
      \     'lineinfo': ' %3l:%-2v',
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \     'cocstatus': 'coc#status',
      \     'currentfunction': 'CocCurrentFunction'
      \   }
      \ }
let g:lightline.separator = {
      \   'left': '', 'right': ''
      \}
let g:lightline.subseparator = {
      \   'left': '', 'right': '' 
      \}


set showtabline=2  " Show tabline

let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

