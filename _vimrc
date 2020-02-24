" GENERAL "
""""""""""""""""""
set nu rnu 
syntax on
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set history=500
let mapleader = ","
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap
set so=7
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
set backspace=2
set belloff=all


"open at right point
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"fix swaps
set undodir=%USERPROFILE%/.vim/tmp
set undofile
set directory^=$HOME/.vim/tmp// 

"Notes Plugin
:let g:notes_suffix = '.txt'


" REMAPS "
"""""""""""""""""""""
noremap <C-k> {
noremap <C-j> }
noremap Y y$
noremap j gj
noremap k gk
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" Alt move
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"change cwd to directory of file 
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"Toggle spell

map <leader>ss :setlocal spell!<cr>


" Vundle "
"""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

"""""""""""""""""""""""
" Plugins "
"""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' 
Plugin 'itchyny/lightline.vim'
Plugin 'shime/vim-livedown'
Plugin 'wakatime/vim-wakatime'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
"Plugin 'valloric/youcompleteme'

" End Vundle"
"""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""

""""""""""""""
" Nerd Tree"
""""""""""""""
map <leader>nn :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


"""""""""""""
"Status Line"
"""""""""""""
if !has('gui_running')
  set t_Co=256
endif

set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'percent' ],
      \              [ 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


""""""""""""""""""""
" Helper Functions "
""""""""""""""""""""

set nu
set tabstop=2
set expandtab
let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'

