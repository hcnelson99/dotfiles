set nocompatible
set shell=/usr/bin/zsh
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-sleuth'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tommcdo/vim-exchange'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'

call plug#end()
filetype plugin indent on

syntax enable

let mapleader="\<Space>"

let g:gitgutter_map_keys = 0

noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>gr :Gread<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>

set diffopt+=vertical
noremap <Leader>dp :diffput<CR>
noremap <Leader>dg :diffget<CR>
noremap <Leader>du :diffupdate<CR>
xnoremap <Leader>dp :diffput<CR>
xnoremap <Leader>dg :diffget<CR>
xnoremap <Leader>du :diffupdate<CR>

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme base16-materia

" disable comment continuation when inserting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set undodir=~/.vim/undo//
set nobackup
set nowritebackup
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
set number "show line numbers
set showcmd " show command in bottom bar
set wildmenu "visual autocomplete for command menu
set showmatch "show matching braces/parens/brackets

set incsearch "search as characters are entered
set inccommand=nosplit "neovim live preview

inoremap jk <esc>

noremap Y y$

noremap <Leader>h :nohls<CR>
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>W :w !sudo tee % > /dev/null<CR>
noremap <Leader>r :source ~/.vimrc<CR>
noremap <Leader>bd :q<CR>
noremap <Leader>i :PlugInstall<CR>
noremap <Leader><Tab> :IndentGuidesToggle<CR>
nnoremap <Leader>l :<C-u>execute 'file '.fnameescape(resolve(expand('%:p')))<bar>
    \ call fugitive#detect(fnameescape(expand('%:p:h')))<CR>

set nospell
map <Leader>s :setlocal spell! spelllang=en_us<CR>
set wrap lbr
