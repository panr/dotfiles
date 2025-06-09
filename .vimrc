call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

syntax on

set clipboard=unnamed

set ruler
set statusline+=%F
set encoding=utf-8
set hlsearch
"set spell
set number
"set relativenumber

let g:onedark_termcolors=256
let g:onedark_color_overrides = {
\ "background": {"gui": "Black", "cterm": "0", "cterm16": "0" },
\}
colorscheme onedark

set background=dark
set termguicolors
hi Search guibg=#cccccc
hi Search cterm=NONE ctermbg=grey

set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=99

set tabstop=2
set shiftwidth=2
set expandtab
"Aligned indentation
set shiftround


"Highlight the edited line.
":autocmd InsertEnter,InsertLeave * set cul!
" 
"Change the cursor while in insert mode.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

