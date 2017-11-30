set shell=/usr/bin/zsh
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-exchange'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'cmugpi/vim-c0', { 'for': 'c0' }
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'guns/vim-sexp', { 'for': ['lisp', 'clojure', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['lisp', 'clojure', 'scheme'] }
Plug 'jpalardy/vim-slime', { 'for': 'lisp' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'tweekmonster/startuptime.vim'

call plug#end()
filetype plugin indent on

syntax enable

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let g:sneak#label = 1
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
let g:gitgutter_map_keys = 0

inoremap jk <esc>
noremap Y y$

" vim-fireplace eval entire file (like cpr for tests)
nnoremap cpf :%Eval<CR>

nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Files<CR>

nnoremap <Space>a :Ack! "\b<cword>\b" <CR>

nnoremap <Space>dp :diffput<CR>
xnoremap <Space>dp :diffput<CR>
nnoremap <Space>dg :diffget<CR>
xnoremap <Space>dg :diffget<CR>
nnoremap <Space>du :diffupdate<CR>
xnoremap <Space>du :diffupdate<CR>

nnoremap <Space>gc :Gcommit<CR>
nnoremap <Space>gd :Gdiff<CR>
nnoremap <Space>gp :Gpush<CR>
nnoremap <Space>gr :Gread<CR>
nnoremap <Space>gs :Gstatus<CR>
nnoremap <Space>gw :Gwrite<CR>

nnoremap <Space>h :nohls<CR>
nnoremap <Space>i :PlugInstall<CR>
nnoremap <Space>l :Lines<CR>
nnoremap <Space>L :<C-u>execute 'file '.fnameescape(resolve(expand('%:p')))<bar>
    \ call fugitive#detect(fnameescape(expand('%:p:h')))<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>Q :q!<CR>
nnoremap <Space>r :source ~/.vimrc<CR>
nnoremap <Space>s :setlocal spell! spelllang=en_us<CR>
nnoremap <Space>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nnoremap <Space>t :Tags<CR>
nnoremap <Space>u :UndotreeToggle<CR>
nnoremap <Space>w :w<CR>
nnoremap <Space>W :w !sudo tee % > /dev/null<CR>

nnoremap <Space>dp :diffput<CR>
xnoremap <Space>dp :diffput<CR>
nnoremap <Space>dg :diffget<CR>
xnoremap <Space>dg :diffget<CR>
nnoremap <Space>du :diffupdate<CR>
xnoremap <Space>du :diffupdate<CR>
set diffopt+=vertical

set background=dark
let base16colorspace=256
colorscheme base16-materia

function! MyColors() abort
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
    highlight LineNr ctermbg=none
    highlight GitGutterAdd ctermbg=none
    highlight GitGutterChange ctermbg=none
    highlight GitGutterDelete ctermbg=none
    highlight GitGutterChangeDelete ctermbg=none
endfunction

augroup Colors
    autocmd!
    autocmd ColorScheme * call MyColors()
augroup END

augroup vimrc
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd BufRead,BufWrite /dev/shm/pass* setlocal noundofile
  autocmd * Files write
augroup END

set noshowmode
if has("persistent_undo")
    set undodir=~/.vim/undodir/
    set undofile
endif

set nobackup
set nowritebackup
set noswapfile

set clipboard=unnamedplus
set backspace=indent,eol,start

set shiftwidth=4 "indent width used for autoindent
set softtabstop=4 "number of spaces inserted when tab is pressed
set expandtab "tabs are spaces
set smartindent
set autoindent
set shiftround
set smarttab
set autoread
set scrolloff=2

set ruler "show cursor location
set number "show line numbers
set showcmd " show command in bottom bar
set wildmenu "visual autocomplete for command menu
set showmatch "show matching braces/parens/brackets

set incsearch
set hlsearch

set showbreak=›››\

set statusline=%<\ %f\ %m%r%w%=%l\/%-6L\ %3c
set laststatus=2

set nospell
set wrap linebreak
