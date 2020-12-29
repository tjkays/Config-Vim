" -- QoL -- "
syntax enable
set cul
set number
set backspace=indent,eol,start
set noswapfile
set path=$PWD/**
"|Allow saving of files as sudo
cmap w!! w !sudo tee > /dev/null %
"|If we're not viewing a diff, bring the cursor to where we last were in the file.
if !&diff
  augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
  augroup END
endif


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
"|To split vertically
nmap <silent> <leader>h :vsplit<CR>
nmap <silent> <leader>l :vsplit<CR>:wincmd l<CR>
"|To split horizontally
nmap <silent> <leader>j :split<CR>:wincmd j<CR>
nmap <silent> <leader>k :split<CR>
"|Space as leader
let mapleader=" "
let maplocalleader=" "

" -- Status Line -- "
set laststatus=2
set noshowmode

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

" -- Autoload Plugins & Config -- "
if empty(glob("~/.vim/autoload/plug.vim"))
    execute 'silent !mkdir -p ~/.vim/autoload/'
    execute 'silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
source ~/Config-Vim/pluginconfig.vim
