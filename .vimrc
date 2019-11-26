" -- QoL -- "
syntax enable
set cul
set number
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" -- Theme -- "
"set t_Co=256
"hi Normal ctermbg=none

" -- Indentation -- "
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent

" -- Splits -- "
set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -- Tabs -- "
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap td :tabclose<CR>

" -- Key maps -- "
"|Ctrl-Backspace in insert mode 
imap <C-BS> <C-W>
"|Redo with U instead of Ctrl+R
noremap U <C-R>

" -- Space as leader -- "
let mapleader=" "
let maplocalleader=" "

" -- Prevent us from developing bad habits -- "
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 10
let g:hardtime_ignore_quickfix = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []

" -- Status Line -- "
set laststatus=2
set noshowmode

" -- UltiSnips -- "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/custom_snips"
let g:UltiSnipsSnippetDirectories=["custom_snips"]
