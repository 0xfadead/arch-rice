set nocompatible "Needed by Vundle
filetype off "Needed by Vundle
set rtp+=~/.vim/bundle/Vundle.vim "Add Vundle to runtime path

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' "Vundle
  Plugin 'vim-airline/vim-airline' "Cool statusline
  Plugin 'vim-airline/vim-airline-themes' "Airline themes
  Plugin 'Shougo/neocomplete.vim' "Tab-complete code
  Plugin 'Shougo/neosnippet.vim' "Snippet support
  Plugin 'tpope/vim-surround' "Better deletion of brackets, parens, etc.
  Plugin 'Shougo/neosnippet-snippets' "Snippet list
  Plugin 'Shougo/context_filetype.vim' "Allow neosnippet to switch filetype on context
  Plugin 'kien/ctrlp.vim' "Fuzzy file/buffer finding/switching
  Plugin 'ludovicchabant/vim-gutentags' "ctag management
  Plugin 'scrooloose/syntastic' "Syntax checker
  Plugin 'notpratheek/vim-luna' "Nice theme
  Plugin 'https://notabug.org/SylvieLorxu/vim-betterK.git' "Improve K command
  Plugin 'tpope/vim-fugitive' " git wrapper
call vundle#end()

" Set up colorscheme
" Manually force all available colors
" and up colors.
syntax enable
set background=dark
colorscheme luna-term
hi Comment guifg=#5C6370 ctermfg=59
"   Range:   233 (darkest) ~ 238 (lightest)
"   Default: 235

" Neocomplete. TODO: update to nvim
let g:neocomplete#enable_at_startup = 1
" Airline-vim
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline_theme='luna'

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

" set hlsearch
set hlsearch

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set utf8 to standard encoding
set encoding=utf8

" Turn on regex
set magic

" Always preference reading off disk
set autoread

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

"Save as sudo with w!! (when lacking root)
cmap w!! w !sudo tee % >/dev/null

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
