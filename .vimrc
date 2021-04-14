" File              : .vimrc
" Author            : Rustam Khafizov <super.rustamm@gmail.com>
" Date              : 31.03.2021 20:37
" Last Modified Date: 15.04.2021 00:19
" Last Modified By  : Rustam Khafizov <super.rustamm@gmail.com>

" Use VIM settings instead of VI, must be first option
set nocompatible

let mapleader = ","

nnoremap <leader>d viwd
nnoremap <leader>u viwU
nnoremap <leader>w :w!<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>i"<esc>`<i"<esc>v`>
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>' <esc>i'<esc>`<i'<esc>v`>
inoremap {<cr> {<cr>}<C-o>O
nnoremap <leader>c :pclose<cr>
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
nnoremap <leader>o :Goyo<cr>
nnoremap H b
nnoremap L w
inoremap kj <esc>

iabbrev adn and
iabbrev waht what
iabbrev tehn then

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

set completeopt-=preview

set history=1000
filetype on
filetype plugin on
filetype indent on
syntax enable 
set colorcolumn=80
set autoread
set number
set foldmethod=indent
set foldlevel=99
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ruler
set cmdheight=1
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch 
set lazyredraw 
set magic
set showmatch 
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

filetype off

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'alpertuna/vim-header'
Plug 'pboettch/vim-cmake-syntax'
Plug 'vhdirk/vim-cmake'
Plug 'junegunn/goyo.vim'
Plug 'mg979/vim-visual-multi'
Plug 'hashivim/vim-terraform'

call plug#end()

filetype plugin indent on

set background=dark
set termguicolors
colorscheme onedark

let g:header_field_author = 'Rustam Khafizov'
let g:header_field_author_email = 'super.rustamm@gmail.com'
let g:header_field_timestamp_format = '%d.%m.%Y %H:%M'
map <F4> :AddHeader<CR>

let g:ycm_filetype_blacklist = { 'terraform': 1, "tf": 1 }
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
