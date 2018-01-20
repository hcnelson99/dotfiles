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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tommcdo/vim-exchange'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'cmugpi/vim-c0', { 'for': 'c0' }
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
Plug 'vimwiki/vimwiki'
Plug 'tweekmonster/startuptime.vim'

call plug#end()
filetype plugin indent on
syntax on

let g:vimwiki_map_prefix = '<Space>o'
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'vim': 'vim'}
let g:vimwiki_list = [wiki]

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

nnoremap <C-o> :Buffers<CR>
nnoremap <C-p> :Files<CR>

nnoremap <Space>a :Ack! "\b<cword>\b" <CR>
nnoremap <Space>c :cd %:p:h<CR>:pwd<CR>

nnoremap <Space>dp :diffput<CR>
xnoremap <Space>dp :diffput<CR>
nnoremap <Space>dg :diffget<CR>
xnoremap <Space>dg :diffget<CR>
nnoremap <Space>du :diffupdate<CR>
xnoremap <Space>du :diffupdate<CR>
set diffopt+=vertical

nnoremap <Space>f :Guifont! Roboto Mono:h20<CR>
nnoremap <Space>F :Guifont! Roboto Mono:h11<CR>
nnoremap <Space>gc :Gcommit<CR>
nnoremap <Space>gd :Gdiff<CR>
nnoremap <Space>gp :Gpush<CR>
nnoremap <Space>gr :Gread<CR>
nnoremap <Space>gs :Gstatus<CR>
nnoremap <Space>gw :Gwrite<CR>

nnoremap <Space>h :nohls<CR>
nnoremap <Space>i :PlugInstall<CR>
nnoremap <Space>l :<C-u>execute 'file '.fnameescape(resolve(expand('%:p')))<bar>
    \ call fugitive#detect(fnameescape(expand('%:p:h')))<CR>
nnoremap <Space>L :Lines<CR>
nnoremap <Space>m :make<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>Q :q!<CR>
nnoremap <Space>r :source ~/.vimrc<CR>
nnoremap <Space>s :setlocal spell! spelllang=en_us<CR>
nnoremap <Space>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nnoremap <Space>t :Tags<CR>
nnoremap <Space>u :UndotreeToggle<CR>
nnoremap <Space>w :w<CR>
nnoremap <Space>W :w !sudo tee %<CR>

set background=dark
colorscheme base16-materia


augroup vimrc
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd BufRead,BufWrite /dev/shm/pass* setlocal noundofile
  autocmd * Files write
  autocmd FileType c,cpp setlocal commentstring=//\ %s
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
if has('nvim')
  set inccommand=split
end
set hlsearch

set showbreak=›››\

set statusline=%<\ %f\ %m%r%w%=%l\/%-6L\ %3c
set laststatus=2

set nospell
set wrap linebreak
