" Author Ricardo Martínez <martinez.calvo.ricardo@gmail.com>

" BASIC CONFIGURATION --------------------------------------- {{{

" Enables modify buffer
set modifiable
" Enables Filetype detection
filetype on
filetype plugin on

" Disable Vi compatibility, must be at top
set nocompatible

" Don’t show the intro message when starting Vim
set shortmess=atI

" Adds defcomponent to special indent words:
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,defcomponent'
setlocal lispwords+=go-loop

" Basics ---------------------------------------------------- {{{ 

" Edit the mapleader key
let mapleader=","

" Use utf8
set encoding=utf8

" Ignore case except if search has uppercase
set ignorecase
set smartcase
set hlsearch
set incsearch

" Use 4 spaces for indent 
set expandtab
set shiftwidth=2
set tabstop=2 

" Show relative line numbers
"set relativenumber
set number

" Set max text width
set textwidth=80

" Show the filename in the window titlebar
set title

" Display file and cursor position
set ruler

" Don’t add empty newlines at the end of files
set noeol

" Use backspace for all
set backspace=indent,eol,start

" }}}

" Appearance --------------------------------------------------------- {{{

syntax enable
colorscheme monokai 
set guifont=Monaco:h10
" }}}

" Nerdtree ----------------------------------------------------------------- {{{
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.o$', '\.hi$', '.DS_Store', '*.swp']
let NERDTreeMapActivateNode='<space>'
"}}}

" Tagbar ------------------------------------------------------------------- {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" Gundo -------------------------------------------------------------------- {{{
nmap <F5> :GundoToggle<CR>
" }}}

" ctrlp-vim ---------------------------------------------------------------- {{{
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_custom_ignore = '\v%(/\.%(git|hg|svn)|\.%(csv|json|class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip|xml|html)$|/target/%(quickfix|resolution-cache|streams)|/target/scala-2.10/%(classes|test-classes|sbt-0.13|cache)|/project/target|/project/project|.gradle|.ensime)'
" }}}

" }}}

" MAPPINGS ---------------------------------------------------------- {{{

" movement mappings ------------------------------------------------- {{{
nnoremap L $
nnoremap H 0
nnoremap J 20j
nnoremap K 20k
nnoremap dL d$
nnoremap dH d0
nnoremap <tab> <c-w>
" }}}

" search ----------------------------------------------- {{{
nnoremap s /
vnoremap s y/<C-R>"<CR>
nnoremap sc :%s/\<<C-r><C-w>\>/
" }}}

" editing mappings -------------------------------------------------- {{{
nnoremap cL c$
nnoremap R <C-r> 
nnoremap D d$

" change to uppercase
nnoremap <C-u> gUiw

" change to lowercase
nnoremap <C-l> guiw

" }}}

" completion mappings ----------------------------------------------- {{{
inoremap " ""<left>
inoremap "" "
inoremap [ []<left>
inoremap [[ [
inoremap [] []
inoremap ( ()<left>
inoremap () ()
inoremap (( (
inoremap { {}<left>
inoremap {} {}
inoremap {{ {
inoremap >> () => {}<left><enter><enter><up><tab>
" }}}

" movement between windows ------------------------------------------ {{{
nmap <tab> <C-w><C-w>
" }}}

" CtrlP plugin ------------------------------------------ {{{
nmap <C-p> :CtrlP<enter>
" }}}

" avoid types ------------------------------------------------------- {{{
nnoremap ; :
nnoremap ñ :
"inoremap  <Esc> 
" }}}

" folding mappings -------------------------------------------------- {{{
nnoremap <Space> za
" }}}

" open vertical split ----------------------------------------------- {{{
map <Leader>s :vsplit<CR>
" }}}

" open .vimrc ------------------------------------------------------- {{{
map <Leader>V :tabedit $MYVIMRC<CR>
" }}}

" auto reload .vimrc ----------------------------------------------- {{{
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" }}}
" afford Vim to save only read files -------------------------------- {{{
cmap w!! w !sudo tee % >/dev/null
" }}}

" }}}

" NeoComplete ------------------------------------------------------ {{{
" Disable AutoComplPop in vim and enable neocomplete instead
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1

" Enable smartcase and camelcase autocompletion
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1

" Change max keyword width in chars (default is 80)
let g:neocomplete#max_keyword_width = 70

" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 3

" Enable auto-select first candidate automatically (like AutoComplPop)
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}

" Syntastic ------------------------------------------------------ {{{
" Stablish js checker as standard
let g:syntastic_javascript_checkers = ['standard']
"Automatic formatting on save
autocmd bufwritepost *.js silent !standard % --format
set autoread
" }}}

" VIM-PLUG --------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
" Show methods and variables
Plug 'majutsushi/tagbar'
Plug 'jakedouglas/exuberant-ctags'
" Git tree
Plug 'sjl/gundo.vim'
" PLugin for syntax check
Plug 'scrooloose/syntastic'
" Buffer management
Plug 'jeetsukumaran/vim-buffergator'
"PLugin for search files
Plug 'kien/ctrlp.vim'
"PLugin for search inside files
Plug 'ervandew/ag'
" PLugin for comments
Plug 'scrooloose/nerdcommenter'
" Improve status line  style
Plug 'bling/vim-airline'
" Zoom into windows <Ctr-w>o to activate
Plug 'troydm/zoomwintab.vim'
" Indent guides <Leader>ig to activate
Plug 'nathanaelkane/vim-indent-guides'
" Plugin for git
Plug 'airblade/vim-gitgutter'
" Plugin for Typescript syntax
Plug 'leafgarland/typescript-vim'
" Instant markdown
Plug 'suan/vim-instant-markdown'
" Clojure Plugins
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace'

call plug#end()
" }}}

" Languages ---------------------------------------------------------- {{{
augroup ft_python
	au!
	au Filetype python setlocal smartindent
	au Filetype python setlocal tabstop=4
	au Filetype python setlocal shiftwidth=4
	au Filetype python setlocal expandtab
	au Filetype python setlocal foldmethod=indent
augroup END

augroup ft_js
	au!
	au FileType javascript setlocal foldmethod=marker
	au Filetype javascript setlocal foldmarker={,}
	au FileType javascript setlocal expandtab
	au FileType javascript setlocal tabstop=2
augroup END

augroup ft_typescript
	au!
	au FileType typescript setlocal foldmethod=marker
	au Filetype typescript setlocal foldmarker={,}
	au FileType typescript setlocal expandtab
	au FileType typescript setlocal tabstop=2
augroup END

augroup ft_clojure
	au!
	au FileType clojure setlocal expandtab
	au FileType clojure setlocal tabstop=2
	au FileType clojure set shiftwidth=2
	au FileType clojure set softtabstop=2
  au FileType clojure map <leader><leader> :Eval<cr>
  au FileType clojure map <F3> :RainbowParenthesesToggle<ENTER>   
  au FileType clojure RainbowParenthesesLoadRound
  au FileType clojure RainbowParenthesesLoadSquare
  au FileType clojure RainbowParenthesesLoadBraces
  au FileType clojure map <leader>w :Require!<CR>
  au FileType clojure silent! call TurnOnClojureFolding()
augroup END
" }}}
