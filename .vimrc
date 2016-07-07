set nocompatible
set shell=/usr/bin/bash
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-grepper'
Plug 'reedes/vim-pencil'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sleuth'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'takac/vim-hardtime'
Plug 'justinmk/vim-sneak'
Plug 'raimondi/delimitmate'

call plug#end()
filetype plugin indent on

syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:grepper = {
    \ 'tools': ['ag', 'git', 'grep'],
    \ 'open':  1,
    \ 'jump':  0,
    \ }

let g:hardtime_maxcount = 2
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1

let g:sneak#streak = 1

" disable comment continuation when inserting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text call pencil#init()
augroup END

set clipboard=unnamedplus
set backspace=2 "allow backspacing over linebreaks,indent, start of insert

set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 "indent width used for autoindent
set softtabstop=4 "number of spaces inserted when tab is pressed
set expandtab "tabs are spaces
set autoindent
set smartindent

set ruler "show cursor location
set relativenumber "show relative line numbers too
set number "show line numbers
set showcmd " show command in bottom bar
set cursorline
set wildmenu "visual autocomplete for command menu
set showmatch "show matching braces/parens/brackets

set incsearch "search as characters are entered

inoremap jk <esc>

let mapleader="\<Space>"
noremap <Leader>W :w !sudo tee % > /dev/null<CR>
noremap <Leader>w :w<CR>
noremap <Leader>r :source ~/.vimrc<CR>
noremap <Leader>q :q<CR>
noremap <Leader>p :PlugInstall<CR>

set spell spelllang=en_us
map <Leader>s :setlocal spell! spelllang=en_us<CR>
set wrap lbr
