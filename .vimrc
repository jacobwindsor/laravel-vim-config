set nocompatible
set t_Co=256
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
" PIV
Plugin 'spf13/PIV'
" Fugitive
Plugin 'tpope/vim-fugitive'


" This is where Vundle packages go. For git repositories: Plugin 'vendor/package'. For Vim Scripts: Plugin 'Package'

" Now we can turn our filetype functionality back on
filetype plugin indent on

" NERDTree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0 " Press I to toggle hidden files
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
let NERDTreeChDirMode=2
let NERDTreeHighlightCursorline=1

" vim-airline
set encoding=utf-8
set guifont=Sauce\ Code\ Powerline:h15	"Install the font on host Putty 'powerline/fonts'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
set term=xterm-256color
set laststatus=2	" Always show the status bar
set showtabline=2
set noshowmode	"Hide the default mode text


" keymaps
nmap <C-s> :w<CR>	" Make sure to add 'stty ixany' and 'stty ixoff -ixon' to .bashrc to disable freezing
nmap vs :vsplit<CR>
nmap sp :split<CR>
nmap <C-d> :bnext<CR>    " Faster buffer changes
nmap <C-a> :bprev<CR>   " Faster buffer changes
nmap <C-x> :bd<CR>  " Close the current buffer"
nmap <CR> za    "Toggle fold

"Standard Settings"
colorscheme spacegray
set nowrap
set tabstop=4
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

