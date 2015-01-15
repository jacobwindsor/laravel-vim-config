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
" VMustache
Plugin 'tobyS/vmustache'
" Ultisnips
Plugin 'SirVer/ultisnips'
" PDV
Bundle 'tobyS/PDV'
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
" PHP
Plugin 'StanAngeloff/php.vim'
" PHP QA Tools
Bundle 'joonty/vim-phpqa.git'
" PHP complete
Bundle 'Shougo/vimproc'
Bundle 'm2mdas/phpcomplete-extended'
" Supertab
Plugin 'ervandew/supertab'
" PHP refactoring
Bundle 'vim-php/vim-php-refactoring'
" Blade syntax
Plugin 'xsbeats/vim-blade'

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

"UltiSnips
let g:UltiSnipsExpandTrigger="<Leader>sn"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" PHP Documentor
inoremap <leader>db <ESC>:call pdv#DocumentWithSnip()<CR>i 
nnoremap <leader>db :call pdv#DocumentWithSnip()<CR> 
vnoremap <leader>db :call pdv#DocumentWithSnip()<CR> 
let g:pdv_template_dir = $HOME ."/.vim/DocBlocks/"

" PHP QA
let g:phpqa_messdetector_autorun = 1
let g:phpqa_codesniffer_args = "--standard=~/.vim/rulesets/phpcs.xml"
let g:phpqa_messdetector_ruleset = "~/.vim/rulesets/phpmd.xml"

" Quick fix window
au FileType qf call MoveAndResize()
function MoveAndResize()
    wincmd L
    vertical res 45
endfunction

nmap <Leader>ec :lcl<CR>
nmap <Leader>en :lne<CR>
imap <Leader>en <ESC>:lne<CR>i
vmap <Leader>en <ESC>:lne<CR>i
nmap <Leader>ep :lp<CR>
imap <Leader>ep <ESC>:lp<CR>i
vmap <Leader>ep <ESC>:lp<CR>

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.swp,*.zip,*.so,*/tmp/*

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_close_on_revert = 1
set hidden " stops undo history deleting after buffer change

" Omincomplete
highlight Pmenu ctermbg=238 gui=bold
set completeopt-=preview
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"PHP complete_extended
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:phpcomplete_index_composer_command="composer"

" Supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" PHP refactoring
let g:php_refactor_command='php ~/.vim/refactor/refactor.phar'

" keymaps
nmap <C-s> :w<CR>	" Make sure to add 'stty ixany' and 'stty ixoff -ixon' to .bashrc to disable freezing
imap <C-s> <ESC>:w<CR>i
nmap vs :vsplit<CR>
nmap sp :split<CR>
nmap <C-d> :bnext<CR>    " Faster buffer changes
nmap <C-a> :bprev<CR>   " Faster buffer changes
nmap <C-x> :bd<CR>  " Close the current buffer"

"Standard Settings"
colorscheme spacegray
set tabstop=4
set shiftwidth=4
set smarttab
set tags=tags
set softtabstop=4
set autoindent
set copyindent
set pastetoggle=<F2>
set expandtab
set shiftround
set backspace=indent,eol,start	" allow backspaceing over evetyting in insert mode
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

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Syntax highlighting
au BufNewFile,BufRead *.blade.php set filetype=blade " Set blade extension syntax

" Folding
set foldmethod=syntax
let php_folding=1
let javaScript_fold=1
let xml_syntax_folding=1
set foldlevelstart=1
autocmd BufWinLeave *.* mkview " Save folds when quitting
autocmd BufWinEnter *.* silent loadview " Save folds when quitting
