set nocompatible
set t_Co=256
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" Nerdtree
Plugin 'scrooloose/nerdtree'
" vim-airline
Plugin 'bling/vim-airline'
"colour-scheme
Plugin 'ajh17/Spacegray.vim'
" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Fugitive
Plugin 'tpope/vim-fugitive'
" PHP DOcumentor
Plugin 'PDV--phpDocumentor-for-Vim'
" Ctrlp
Plugin 'kien/ctrlp.vim'
" Commentary
Plugin 'tpope/vim-commentary'
" Easymotion
Plugin 'Lokaltog/vim-easymotion'
" Surround
Plugin 'tpope/vim-surround'
" Gundo
Plugin 'sjl/gundo.vim'

" All plugins must be defined before here
call vundle#end()
filetype plugin indent on

" NERDTree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0 " Press I to toggle hidden files
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
let NERDTreeChDirMode=2
let NERDTreeHighlightCursorline=1
autocmd StdinReadPre * let s:std_in=1 " Open NerdTree on launch if no file selected
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " Close vim if only NerdTree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if only NerdTree open

" vim-airline
set encoding=utf-8
set guifont=Meslo\ LG\ M\ for\ Powerline	"Install the font on host Putty 'powerline/fonts'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
set term=xterm-256color
set laststatus=2	" Always show the status bar
set showtabline=2
set noshowmode	"Hide the default mode text

" PHP Documentor
inoremap <C-h> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-h> :call PhpDocSingle()<CR> 
vnoremap <C-h> :call PhpDocRange()<CR> 

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.swp,*.zip,*.so,*/tmp/*

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_close_on_revert = 1

" keymaps
nmap <C-s> :w<CR>	" Make sure to add 'stty ixany' and 'stty ixoff -ixon' to .bashrc to disable freezing
nmap vs :vsplit<CR>
nmap sp :split<CR>
nmap <C-d> :bnext<CR>    " Faster buffer changes
nmap <C-a> :bprev<CR>   " Faster buffer changes
nmap <C-x> :bd<CR>  " Close the current buffer"

"Standard Settings"
colorscheme spacegray
set nowrap
set tabstop=4
set shiftwidth=4
set smarttab
set tags=tags
set softtabstop=4
set expandtab
set shiftround
set autoindent
set backspace=indent,eol,start	" allow backspaceing over evetyting in insert mode
set copyindent
set number
set ignorecase
set smartcase
set noerrorbells
set autowrite

" Disable all beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

"Take off automatic folding
:set foldlevelstart=99
