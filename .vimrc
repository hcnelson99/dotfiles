set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'reedes/vim-pencil'

filetype plugin on

syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text call pencil#init()
augroup END

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 "number of spaces inserted when tab is pressed
set expandtab "tabs are spaces

set number "show line numbers
set showcmd " show command in bottom bar
set cursorline "highlight current line
filetype indent on "load language specific indentation files
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when necessary
set showmatch "show matching braces/parens/brackets

set incsearch "search as characters are entered

inoremap jk <esc>

set spell spelllang=en_us
set wrap lbr
