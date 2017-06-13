" Enable mouse input

" Set up colorscheme
" Manually force all available colors
" and up colors.
set t_Co=256
" colo delek
syntax on

" Sets line numbers
set number

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

" Intelligent indentation & tabs
set autoindent
set smartindent 
set smartcase
set smarttab 

" No backup
set noswapfile 

" Show commands
set showcmd

" Show current position 
set ruler 

" Toggle hlsearch with F1 
nnoremap <F1> :set hlsearch!<CR>

" Toggle paste with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Toggle line numbers with F3
nnoremap <F3> :set nonumber!<CR>
