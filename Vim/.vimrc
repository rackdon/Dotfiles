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
set shiftwidth=4
set tabstop=4 

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
set guifont=Monaco:h14
" }}}

" Nerdtree ----------------------------------------------------------------- {{{
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.o$', '\.hi$']
let NERDTreeMapActivateNode='<space>'
"}}}

" Tagbar ------------------------------------------------------------------- {{{
nmap <F8> :TagbarToggle<CR>
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

" open search ----------------------------------------------- {{{
nnoremap s /
" }}}

" editing mappings -------------------------------------------------- {{{
nnoremap cL c$
nnoremap R <C-r> 
nnoremap D d$

" change to uppercase
nnoremap <C-u> gUiw

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
" }}}

" movement between windows ------------------------------------------ {{{
nmap <tab> <C-w><C-w>
" }}}

" avoid types ------------------------------------------------------- {{{
nnoremap ; :
nnoremap ñ :
inoremap Ñ <Esc> 
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

" VIM-PLUG --------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'
Plug 'jeetsukumaran/vim-buffergator'
" PLugin for comments
Plug 'scrooloose/nerdcommenter'
" On-demand loading
Plug 'amirh/HTML-AutoCloseTag', { 'for' : ['html', 'xml', 'xhtml'] }
" Improve status line  style
Plug 'bling/vim-airline'
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
" }}}
