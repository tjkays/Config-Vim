" -- QoL -- "
syntax enable
set cul
set number
set backspace=indent,eol,start
set noswapfile
set path=$PWD/**

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

" -- Key maps -- "
"|Tabs"
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap td :tabclose<CR>
"|Ctrl-Backspace in insert mode
imap <C-BS> <C-W>
"|Redo with U instead of Ctrl+R
noremap U <C-R>
"|Toggle relative line numbers
noremap <S-r> :set invrnu<CR>
"|Tagbar
nmap <F8> :TagbarToggle<CR>
"|To split vertically
nmap <silent> <leader>h :vsplit<CR>
nmap <silent> <leader>l :vsplit<CR>:wincmd l<CR>
"|To split horizontally
nmap <silent> <leader>j :split<CR>:wincmd j<CR>
nmap <silent> <leader>k :split<CR>

" -- Space as leader -- "
let mapleader=" "
let maplocalleader=" "

" -- Prevent us from developing bad habits -- "
"let g:hardtime_default_on = 1
"let g:hardtime_maxcount = 10
"let g:hardtime_ignore_quickfix = 1
"let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
"let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
"let g:list_of_insert_keys = []

" -- Status Line -- "
set laststatus=2
set noshowmode

" -- UltiSnips -- "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/custom_snips"
let g:UltiSnipsSnippetDirectories=["custom_snips"]

" -- NetRW -- "
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_browse_split=3
let g:netrw_banner=0
let g:netrw_liststyle=3
map <C-i> :call NewExplorer()<CR>

function! NewExplorer()
    tabnew
    Expl
    tabmove 0
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    silent! unmap <buffer> t
endfunction

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

let g:htl_all_templates=1
