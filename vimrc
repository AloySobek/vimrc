" File              : .vimrc
" Author            : Rustam Khafizov <super.rustamm@gmail.com>
" Date              : 31.03.2021 20:37
" Last Modified Date: 23.05.2021 00:24
" Last Modified By  : Rustam Khafizov <super.rustamm@gmail.com>

" Use VIM settings instead of VI, must be first option
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                MAP BLOCK                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

" Delete entire word
nnoremap <leader>d viwd

" Make whole word in UPPERCASE
nnoremap <leader>u viwU

" Quick vimrc edit from everywhere
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Quick quotes wrapping
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
vnoremap <leader>" <esc>i"<esc>`<i"<esc>v`>
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>' <esc>i'<esc>`<i'<esc>v`>

" Auto brackets when enter was pressed
inoremap {<cr> {<cr>}<C-o>O

" Move faster with uppercase arrows
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
nnoremap H b
nnoremap L w
vnoremap H b
vnoremap L w

" SUPER COOL SHORTCUT, instead of <esc> use kj
inoremap kj <esc>

" <c-space> coc.nvim force to show autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

" YouCompleteMe quick fix
nnoremap <leader>f :YcmCompleter FixIt<cr>

" VSCode like terminal
nnoremap <leader>t :terminal<cr><C-w>k:resize +15<cr><C-w>j

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               ABBREV BLOCK                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbrev adn and
iabbrev waht what
iabbrev tehn then

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                SET BLOCK                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Undo dir settings
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Disable annoying preview windows
set completeopt-=preview

" Command line history length
set history=1000

" Detect file type load indent for this file and necessary plugins
filetype on
filetype plugin on
filetype indent on

syntax enable 

" Column line(right border for your code)
set colorcolumn=80

" Auto read if file changed outside
set autoread

" Enable number line on the left
set number

" Folding settings
set foldmethod=indent
set foldlevel=99

" vim command line <tab> autocomplete
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Show number of line and columnt in right bottom corner
set ruler

"Height of vim command line
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
set splitbelow
set mouse=a

filetype off

call plug#begin('~/.vim/plugged')

" C/C++ plugins
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pboettch/vim-cmake-syntax'
Plug 'vhdirk/vim-cmake'

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'alpertuna/vim-header'
Plug 'junegunn/goyo.vim'
Plug 'mg979/vim-visual-multi'
Plug 'hashivim/vim-terraform'
Plug 'dart-lang/dart-vim-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

filetype plugin indent on

set background=dark
set termguicolors
colorscheme onedark

" NERDTree always show hidden files
let NERDTreeShowHidden=1

let g:header_auto_add_header = 0
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

" Mapping to use pop-up scrolling
nnoremap <expr> <c-j> ScrollPopUp(1) ? '<esc>' : '<c-d>'
nnoremap <expr> <c-k> ScrollPopUp(0) ? '<esc>' : '<c-u>'

" This function allows you to scroll CoC pop-up menus
function ScrollPopUp(down)
    let winid = FindCursorPopUp()
    if winid == 0
        return 0
    endif

    let pp = popup_getpos(winid)
    call popup_setoptions( winid,
        \ {'firstline' : pp.firstline + ( a:down ? 1 : -1 ) } )

    return 1
endfunction

function FindCursorPopUp()                                                                                                                                                                                            
    let radius = get(a:000, 0, 2)
    let srow = screenrow()
    let scol = screencol()

    " it's necessary to test entire rect, as some popup might be quite small
    for r in range(srow - radius, srow + radius)
        for c in range(scol - radius, scol + radius)
            let winid = popup_locate(r, c)
            if winid != 0
                return winid
            endif
        endfor
    endfor
    
    return 0
endfunction

" Due to implementation - disable annoying bell while scrolling
set belloff+=esc
