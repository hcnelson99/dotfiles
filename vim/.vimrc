set nocompatible
set shell=/usr/bin/zsh
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-grepper'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sleuth'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
Plug 'bfredl/nvim-miniyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'w0ng/vim-hybrid'
Plug 'rust-lang/rust.vim'
Plug 'tommcdo/vim-exchange'

call plug#end()
filetype plugin indent on

syntax enable

let g:gitgutter_map_keys = 0

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid

let g:grepper = {
    \ 'tools': ['ag', 'git', 'grep'],
    \ 'open':  1,
    \ 'jump':  0,
    \ }

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

let mapleader="\<Space>"

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <C-k> <Plug>(miniyank-cycle)

let g:sneak#streak = 1

" disable comment continuation when inserting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set noswapfile

set clipboard=unnamedplus
set backspace=2 "allow backspacing over linebreaks,indent, start of insert

set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 "indent width used for autoindent
" set softtabstop=4 "number of spaces inserted when tab is pressed
" set expandtab "tabs are spaces
set autoindent
set smartindent
set autoread
set scrolloff=2

set ruler "show cursor location
set relativenumber "show relative line numbers too
set number "show line numbers
set showcmd " show command in bottom bar
set wildmenu "visual autocomplete for command menu
set showmatch "show matching braces/parens/brackets

set incsearch "search as characters are entered
set inccommand=nosplit

inoremap jk <esc>

noremap <Leader>h :nohls<CR>
noremap <Leader>fS :w !sudo tee % > /dev/null<CR>
noremap <Leader>fs :w<CR>
noremap <Leader>r :source ~/.vimrc<CR>
noremap <Leader>bd :q<CR>
noremap <Leader>i :PlugInstall<CR>
noremap <Leader>g :Grepper<CR>
noremap <Leader><Tab> :IndentGuidesToggle<CR>

set nospell
map <Leader>s :setlocal spell! spelllang=en_us<CR>
set wrap lbr
