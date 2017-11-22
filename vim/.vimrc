set nocompatible
set shell=/usr/bin/zsh
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tommcdo/vim-exchange'
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/gina.vim'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'cmugpi/vim-c0'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/YankRing.vim'

call plug#end()
filetype plugin indent on

syntax enable

let mapleader="\<Space>"

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let g:lightline = {
      \ 'colorscheme': 'base16',
      \ }

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}

let g:airline_powerline_fonts = 1

let g:gitgutter_map_keys = 0

" vim-fireplace eval entire file (like cpr for tests)
noremap cpf :%Eval<CR>

noremap <Leader>gd :Gina compare<CR>
noremap <Leader>gs :call magit#show_magit('h')<CR>
noremap <Leader>gc :Gina commit<CR>
noremap <Leader>gp :Gina push<CR>
noremap <Leader>t :Tags<CR>
noremap <C-f> :Files<CR>
noremap <C-b> :Buffers<CR>
noremap <Leader>a :Ack! "\b<cword>\b" <CR>
noremap <Leader>u :UndotreeToggle<CR>
noremap <Leader>y :YRShow<CR>
noremap <Leader>c :YRCheckClipboard<CR>

noremap <Leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>

set diffopt+=vertical
noremap <Leader>dp :diffput<CR>
noremap <Leader>dg :diffget<CR>
noremap <Leader>du :diffupdate<CR>
xnoremap <Leader>dp :diffput<CR>
xnoremap <Leader>dg :diffget<CR>
xnoremap <Leader>du :diffupdate<CR>

set background=dark
let base16colorspace=256
colorscheme base16-materia
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi GitGutterAdd ctermbg=none
hi GitGutterChange ctermbg=none
hi GitGutterDelete ctermbg=none
hi GitGutterChangeDelete ctermbg=none

" disable comment continuation when inserting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set noshowmode
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
set nobackup
set nowritebackup
set noswapfile

set clipboard=unnamedplus
set backspace=2 "allow backspacing over linebreaks,indent, start of insert

set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 "indent width used for autoindent
set softtabstop=4 "number of spaces inserted when tab is pressed
set expandtab "tabs are spaces
set autoindent
set smartindent
set autoread
set scrolloff=2

set ruler "show cursor location
set number "show line numbers
set relativenumber "show line numbers
set showcmd " show command in bottom bar
set wildmenu "visual autocomplete for command menu
set showmatch "show matching braces/parens/brackets

set incsearch "search as characters are entered
if has('nvim')
  set inccommand=nosplit "neovim live preview
endif

inoremap jk <esc>

noremap Y y$
" i$ as text object
onoremap i$ :normal! T$v,<CR>
vnoremap i$ <esc>T$v,
" a$ as text object
onoremap a$ :normal! F$v,<CR>
vnoremap a$ <esc>F$v,

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
