scriptencoding utf-8

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-eunuch'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'tommcdo/vim-lion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'b4winckler/vim-angry'
Plug 'jpalardy/vim-slime'

Plug 'stfl/meson.vim', { 'for': 'meson' }
Plug 'guns/vim-sexp', { 'for': ['lisp', 'clojure', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['lisp', 'clojure', 'scheme'] }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'alvan/vim-closetag'
Plug 'jez/vim-better-sml'
Plug 'leafgarland/typescript-vim'
Plug 'ziglang/zig.vim'
Plug 'zah/nim.vim'
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'rust-lang/rust.vim'
Plug 'fidian/hexmode'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'vim-syntastic/syntastic'
" Plug 'dense-analysis/ale'
Plug 'tikhomirov/vim-glsl'
Plug 'jez/vim-ispc'
Plug 'purescript-contrib/purescript-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'frigoeu/psc-ide-vim'
Plug 'Tetralux/odin.vim'

Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'sbdchd/neoformat'
Plug 'kana/vim-altr'

Plug 'fxn/vim-monochrome'

Plug 'tweekmonster/startuptime.vim'

Plug 'hcnelson99/wyvern.vim'

call plug#end()
filetype plugin indent on
syntax on

let g:ale_linters = {'clojure': ['clj-kondo']}

let g:rustfmt_autosave = 1

let g:syntastic_d_compiler_options="-version=SDL_TTF -J=./fonts/"

let g:slime_target = "kitty"


if executable('opam') && isdirectory(fnamemodify('~/.opam', ':p'))
  let g:opamshare = substitute(system('opam var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
  let g:syntastic_ocaml_checkers = ['merlin']
  let g:merlin_textobject_grow   = 'm'
  let g:merlin_textobject_shrink = 'M'
  let g:merlin_split_method = 'never'
endif

call altr#define('%/%.ml', '%/%.mli',  '%/%_intf.ml', '%/%.mly', '%/%.mll')

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_clojure_checkers = ['eastwood']
command ShadowConnect :CljEval (shadow/repl :app)

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" let g:loaded_youcompleteme = 1
let g:ycm_always_populate_location_list = 1

let g:nim_highlight_space_errors = 0
let g:go_highlight_trailing_whitespace_error = 0

" inoremap jk <esc>
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
noremap Y y$

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ':nohls<CR>'

nnoremap ` '
nnoremap ' `

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Buffers<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-Tab> g<Tab>
if exists(":tnoremap")
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
  tnoremap <Esc> <C-w>N
  tnoremap <C-w>N
  tnoremap <C-Tab> <C-w>Ng<Tab>
endif

" vim-fireplace eval entire file (like cpr for tests)
nnoremap cpu :execute "Eval (ns-unmap *ns* '" . expand("<cword>") . ")"<cr>
nnoremap cpR :RunAllTests<CR>
nnoremap cpf :%Eval<CR>
nnoremap cpe :Eval<CR>
nnoremap cpc :Piggieback (adzerk.boot-cljs-repl/repl-env)<CR>

nnoremap <Space><Space> :MerlinErrorCheck<CR>
nnoremap <Space>a :Ack! "\b<cword>\b" <CR>
nnoremap <Space>c :cd %:p:h<CR>:pwd<CR>

nnoremap <Space>dp :diffput<CR>
xnoremap <Space>dp :diffput<CR>
nnoremap <Space>dg :diffget<CR>
xnoremap <Space>dg :diffget<CR>
nnoremap <Space>du :diffupdate<CR>
xnoremap <Space>du :diffupdate<CR>
set diffopt+=vertical

nnoremap <Space>e :e!<CR>
" nnoremap <Space>f :<C-u>execute 'file '.fnameescape(resolve(expand('%:p')))<bar>
"     \ call fugitive#detect(fnameescape(expand('%:p:h')))<CR>:w!<CR>

nnoremap <Space>gc :Git commit -am .<CR>
nnoremap <Space>gd :Git diff<CR>
nnoremap <Space>gp :Git push<CR>
nnoremap <Space>gr :Gread<CR>
nnoremap <Space>gs :Git<CR>
nnoremap <Space>gw :Gwrite<CR>

nmap - <Plug>VinegarUp
nnoremap <Space>s :vsplit<CR>
nnoremap <Space>i :call altr#forward()<CR>
set listchars=eol:$,tab:>-,trail:~,space:␣
nnoremap <Space>l :set list!<CR>
nnoremap <Space>m :make<CR>
nnoremap <Space>n :!./shooter<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>fed :e ~/.vimrc<CR>
nnoremap <Space><Tab> <C-^>
nnoremap <Space>r :source ~/.vimrc<CR>
nnoremap <Space>v :split<CR>
nnoremap <Space>S :setlocal spell! spelllang=en_us<CR>


nnoremap <Space>t :MerlinTypeOf<CR>
" nnoremap <Space>t :call CocActionAsync('doHover')<CR>
" nnoremap <Space>t /\v\s+$<CR>
nnoremap <Space>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nnoremap <Space>u g~iw
nnoremap <Space>w :w<CR>
nnoremap <Space>W :w !sudo tee %<CR>
nnoremap <Space>8 /\%>80v.\+<CR>

command StripWhitespace %s/\v\s+$//

set background=light
if has("termguicolors")
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  let &t_SI .= "\<Esc>[6 q"
  let &t_SR .= "\<Esc>[3 q"
  let &t_EI .= "\<Esc>[2 q"
  " disable background color erase so termguicolors 
  " background color isn't lost on scroll
  set t_ut=""
  set termguicolors
endif
colorscheme base16-materia
" colorscheme solarized8

set go-=l
set go-=L
set go-=r
set go-=R
set go-=m
set go-=T
set guifont=PragmataPro\ Mono\ 16

augroup vimrc
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd BufRead,BufWrite /dev/shm/pass* setlocal noundofile
  autocmd FileType c,cpp setlocal commentstring=//\ %s
  autocmd FileType c,cpp nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
  autocmd FileType ocaml nnoremap <buffer> <C-]> :MerlinLocate<CR>
  autocmd FileType ocaml,cpp,d autocmd! BufWritePre <buffer> silent! undojoin | Neoformat
  autocmd FileType meson setl cms=#%s
  autocmd FileType sml setl cms=(*%s*)
  autocmd FileType go setl tabstop=4
  autocmd FileType template setl cms=<!--%s-->
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


set clipboard^=unnamed,unnamedplus
set backspace=indent,eol,start

set complete-=i

set shiftwidth=4 "indent width used for autoindent
set softtabstop=4 "number of spaces inserted when tab is pressed
set expandtab "tabs are spaces
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
set autowrite

" workaround vim not understanding compound highlight syntax
let g:c_no_bracket_error=1

" for odin
" set errorformat=%E%f(%l:%c)\ %m,%C[^\n],%C%p^
