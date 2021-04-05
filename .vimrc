" File              : .vimrc
" Author            : Rustam Khafizov <super.rustamm@gmail.com>
" Date              : 31.03.2021 20:37
" Last Modified Date: 03.04.2021 16:23
" Last Modified By  : Rustam Khafizov <super.rustamm@gmail.com>

" Use VIM settings instead of VI, must be first option
set nocompatible

" Custom map leader, like Ctrl for example (<c-u> become <leader>u)
let mapleader = ","

" Mapping
nnoremap <leader>d viwd
nnoremap <leader>u viwU
nnoremap <leader>w :w!<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>i"<esc>`<i"<esc>v`>
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>' <esc>i'<esc>`<i'<esc>v`>
inoremap {<CR> {<CR>}<C-o>O
nnoremap <leader>c :pclose<cr>
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {

" Exit from insert to normal mode relearining
" inoremap <esc> <nop>
inoremap kj <esc>

" " Abbreviations
" iabbrev adn and
" iabbrev waht what
" iabbrev tehn "then

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
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'alpertuna/vim-header'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'vhdirk/vim-cmake'
Plugin 'cpiger/NeoDebug'

call vundle#end()
filetype plugin indent on

set background=dark
set termguicolors
colorscheme onedark

let g:header_field_author = 'Rustam Khafizov'
let g:header_field_author_email = 'super.rustamm@gmail.com'
let g:header_field_timestamp_format = '%d.%m.%Y %H:%M'
map <F4> :AddHeader<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

let g:neodbg_keymap_toggle_breakpoint  = '<F9>'         " toggle breakpoint on current line
let g:neodbg_keymap_next               = '<F10>'        " next
let g:neodbg_keymap_run_to_cursor      = '<C-F10>'      " run to cursor (tb and c)
let g:neodbg_keymap_jump               = '<C-S-F10>'    " set next statement (tb and jump)
let g:neodbg_keymap_step_into          = '<F11>'        " step into
let g:neodbg_keymap_step_out           = '<S-F11>'      " setp out
let g:neodbg_keymap_continue           = '<F5>'         " run or continue
let g:neodbg_keymap_print_variable     = '<C-P>'        " view variable under the cursor
let g:neodbg_keymap_stop_debugging     = '<S-F5>'       " stop debugging (kill)
let g:neodbg_keymap_toggle_console_win = '<F6>'         " toggle console window
let g:neodbg_keymap_terminate_debugger = '<C-C>'        " terminate debugger
