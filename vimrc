" For external plugins
execute pathogen#infect()

" Set up colorscheme
" Manually force all available colors
" and up colors.
syntax enable
set background=dark
" Fallback and use default color scheme on terminal
let g:solarized_termcolors=16
let g:solarized_termtrans = 1
colorscheme solarized

" NERDTree
autocmd vimenter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline-vim
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline_theme='solarized'

" Sets line numbers
set number
set relativenumber

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

" For programming (python)
filetype indent on

" Toggle hlsearch with F1
nnoremap <F1> :set hlsearch!<CR>

" Toggle paste with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Toggle line numbers with F3
nnoremap <F3> :set norelativenumber! nonumber!<CR>
