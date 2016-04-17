set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'reedes/vim-pencil'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
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

" disable comment continuation when inserting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text call pencil#init()
augroup END

set backspace=2 "allow backspacing over linebreaks,indent, start of insert

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 "number of spaces inserted when tab is pressed
set expandtab "tabs are spaces

set number "show line numbers
set showcmd " show command in bottom bar
set cursorline
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when necessary
set showmatch "show matching braces/parens/brackets

set incsearch "search as characters are entered

inoremap jk <esc>

nnoremap j gj
nnoremap k gk

let mapleader="\<Space>"
noremap <Leader>W :w !sudo tee % > /dev/null<CR>
noremap <Leader>w :w<CR>
noremap <Leader>r :source %<CR>
noremap <Leader>q :q<CR>
noremap <Leader>p :PluginInstall<CR>

set wrap lbr
