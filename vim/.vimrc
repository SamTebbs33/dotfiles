set hidden
set exrc
set secure
set nocompatible
set noshowmode
set smarttab
set ignorecase
set smartcase
set smartindent
set autoindent
execute pathogen#infect()
set number
set numberwidth=1
syntax on
filetype plugin indent on
Helptags
set visualbell
set paste
set hlsearch

let mapleader = " "
nnoremap <tab> <esc>
nnoremap <leader>c "*yy
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>f :Autoformat<CR>
set backspace=indent,eol,start
" Reload .vimrc
nnoremap <leader>r :so ~/.vimrc<CR>
" Select all
nnoremap <leader>a ggVGG
nnoremap <leader><Down> <PageDown>
nnoremap <leader><Up> <PageUp>
" Window movement
nnoremap wh <c-w>h
nnoremap w<left> <c-w>h
nnoremap wj <c-w>j
nnoremap w<down> <c-w>j
nnoremap wk <c-w>k
nnoremap w<up> <c-w>k
nnoremap wl <c-w>l
nnoremap w<right> <c-w>l

" Make one line visible above and below cursor
set scrolloff=1
set display+=lastline
" Share clipboards across terminals
set clipboard=unnamed

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Change swap
set directory=/tmp

" Set filtype when opening i3 config
autocmd BufEnter ~/dotfiles/i3/.config/i3/config set ft=i3config

" Change vim shell to the standard shell
if &shell =~# 'fish$'
	set shell=sh
endif

" Colourscheme
colorscheme jellybeans

" Airline

" Nerdtree
" open when opening vim without a path sepcified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "*",
    \ "Untracked" : "",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "!",
    \ "Deleted"   : "-",
    \ "Dirty"     : "~",
    \ "Clean"     : "",
    \ 'Ignored'   : "",
    \ "Unknown"   : "?"
    \ }
