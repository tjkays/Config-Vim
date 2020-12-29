call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline'
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'majutsushi/tagbar'
Plug 'takac/vim-hardtime'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim'
call plug#end()

" -- Tagbar Config -- "
nmap <F8> :TagbarToggle<CR>

" -- Prevent us from developing bad habits -- "
"let g:hardtime_default_on = 1
"let g:hardtime_maxcount = 10
"let g:hardtime_ignore_quickfix = 1
"let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
"let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
"let g:list_of_insert_keys = []

let g:htl_all_templates=1

" -- Fuzzy Find -- "
function! s:fzf_workspace_files()
  let hg_root = systemlist('hg root')[0]
  let is_hg = v:shell_error
  if (system('git rev-parse --is-inside-work-tree') =~ 'true')
    :GFiles -co --exclude-standard
  elseif (is_hg == 0)
    let fallback = "cat ~/.g4d | " .
          \ "grep alias | " .
          \ "awk '{print $3}' | " .
          \ "xargs -I _ find ".hg_root."_ -type f 2>/dev/null | " .
          \ "cut -c $(($(echo '".hg_root."' | wc -c) + 1))-"
    call fzf#run(fzf#wrap(
          \ 'Hg',
          \ {'source': "(hg files;".fallback.") | awk '!x[$0]++'", 'dir': hg_root},
          \ 0))
  else
    :Files
  endif
endfunction

" Set ctrlp to browse for files in git repository.
map <silent> <C-P> :Files<CR>
map <silent> <C-A-P> :GFiles -co --exclude-standard<CR>

" -- COC Configuration -- "
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent>[v <Plug>(coc-diagnostic-prev)
nmap <silent>]v <Plug>(coc-diagnostic-next)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent>K :call <SID>show_documentation()<CR>

nmap <silent>gd <Plug>(coc-codeaction)
nmap <silent>gf <Plug>(coc-fix-current)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gR <Plug>(coc-rename)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nnoremap <silent>go :<C-u>CocList outline<cr>
nnoremap <silent>gD :<C-u>CocList diagnostics<cr>
