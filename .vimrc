" Enable mouse input

" Set up colorscheme
" Manually force all available colors
" and up colors.
set t_Co=256
colo delek
syntax on

" Sets line numbers
set nu       

" Tab key adds 4 spaces, 
" pushing delete will delete the 4 spaces as if it were a tab character
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Fix my backspaces 
set backspace=indent,eol,start

" Disable arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" set hlsearch 
set hlsearch 

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set utf8 to standard encoding 
set encoding=utf8

" Turn on regex
set magic 

" Intelligent indentation 
set ai
set si

" Show current position 
set ruler 

