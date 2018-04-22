call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-sleuth'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tommcdo/vim-exchange'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'

Plug 'stfl/meson.vim', { 'for': 'meson' }
Plug 'guns/vim-sexp', { 'for': ['lisp', 'clojure', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['lisp', 'clojure', 'scheme'] }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'tweekmonster/startuptime.vim'

call plug#end()
filetype plugin indent on
syntax on

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif


let g:sneak#label = 1

let g:gitgutter_map_keys = 0

inoremap jk <esc>
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
noremap Y y$
nnoremap <CR> :nohls<CR>

nnoremap / /\v
vnoremap / /\v
set gdefault

nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Buffers<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" vim-fireplace eval entire file (like cpr for tests)
nnoremap cpf :%Eval<CR>
nnoremap cpe :Eval<CR>
nnoremap cpc :Piggieback (adzerk.boot-cljs-repl/repl-env)<CR>

nnoremap <Space>a :Ack! "\b<cword>\b" <CR>
nnoremap <Space>c :cd %:p:h<CR>:pwd<CR>

nnoremap <Space>dp :diffput<CR>
xnoremap <Space>dp :diffput<CR>
nnoremap <Space>dg :diffget<CR>
xnoremap <Space>dg :diffget<CR>
nnoremap <Space>du :diffupdate<CR>
xnoremap <Space>du :diffupdate<CR>
set diffopt+=vertical

nnoremap <Space>gc :Gcommit<CR>
nnoremap <Space>gd :Gdiff<CR>
nnoremap <Space>gp :Gpush<CR>
nnoremap <Space>gr :Gread<CR>
nnoremap <Space>gs :Gstatus<CR>
nnoremap <Space>gw :Gwrite<CR>

nnoremap <Space>i :PlugInstall<CR>
nnoremap <Space>l :<C-u>execute 'file '.fnameescape(resolve(expand('%:p')))<bar>
    \ call fugitive#detect(fnameescape(expand('%:p:h')))<CR>
nnoremap <Space>m :make<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>r :source ~/.vimrc<CR>
nnoremap <Space>s :setlocal spell! spelllang=en_us<CR>
nnoremap <Space>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nnoremap <Space>u :UndotreeToggle<CR>
nnoremap <Space>w :w<CR>
nnoremap <Space>W :w !sudo tee %<CR>
nnoremap <Space>8 /\%>80v.\+<CR>

set background=dark
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
let &t_SI .= "\<Esc>[6 q"
let &t_SR .= "\<Esc>[3 q"
let &t_EI .= "\<Esc>[2 q"
set termguicolors
colorscheme base16-materia


augroup vimrc
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd BufRead,BufWrite /dev/shm/pass* setlocal noundofile
  autocmd FileType c,cpp setlocal commentstring=//\ %s
  autocmd FileType meson setl cms=#%s
  autocmd FileType sml setl cms=(*%s*)
augroup END

set wildmenu

set mouse=a
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

set number
set showcmd
set showmatch "show matching braces/parens/brackets

set incsearch
if has('nvim')
  set inccommand=split
end
set hlsearch

set showbreak=››\

set statusline=%<%f\ %m%r%w%=%l\,%c
set laststatus=2

set nospell
set wrap linebreak
