" For external plugins
execute pathogen#infect()

" Set up colorscheme
" Manually force all available colors
" and up colors.
syntax enable
set background=dark
colorscheme space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59
"   Range:   233 (darkest) ~ 238 (lightest)
"   Default: 235
let g:space_vim_dark_background = 234
color space-vim-dark

" Airline-vim
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline_theme='violet'

" YouCompleteMe -- Don't ask to use local extras
let g:ycm_confirm_extra_conf = 0

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

" Reload files modified outside vim
set autoread

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
set smarttab

" Case insensitive search, except with capital letters
set ignorecase
set smartcase

" No backup
set noswapfile

" Show commands
set showcmd

" Show current position
set ruler

" Enable filetype detection
filetype on
filetype plugin on
filetype indent on

" Delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Don't expand tabs on Makefile
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Recursively search up to home dir for ctags
" Going up to root is too expensive
set tags+=tags;$HOME

" Ctrl+\ to up function definition in vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Toggle hlsearch with F1
nnoremap <F1> :set hlsearch!<CR>

" Toggle paste with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Toggle line numbers with F3
nnoremap <F3> :set norelativenumber! nonumber!<CR>
