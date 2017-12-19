" For external plugins
execute pathogen#infect()

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set up colorscheme
" Manually force all available colors
" and up colors.

syntax on
colorscheme solarized
set background=dark

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

" Ranger integration 
let g:ranger_map_keys = 0

" For LaTeX
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'

" The rate at which the output PDF is updated
autocmd Filetype tex setl updatetime=1 

" PDF viewer program for previewing
let g:livepreview_previewer = 'zathura'

nmap <F12> :LLPStartPreview<cr>
