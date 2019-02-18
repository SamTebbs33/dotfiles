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
nnoremap <leader>r :so ~/.vimrc<CR>
nnoremap <leader>a ggVGG
nnoremap <leader><Down> <PageDown>
nnoremap <leader><Up> <PageUp>

" Make one line visible above and below cursor
set scrolloff=1
set display+=lastline
" Share clipboards across terminals
set clipboard=unnamed

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Tab things
au BufAdd,BufNewFile * nested tab sball
nnoremap <leader>b :tabl<CR>
nnoremap <leader>n :tabn<CR>
" alias tabnew to tn
cnoreabbrev <expr> tn getcmdtype() == ":" && getcmdline() == 'tn' ? 'tabnew' : 'tn'
" alias tabedit to te
cnoreabbrev <expr> te getcmdtype() == ":" && getcmdline() == 'te' ? 'tabedit' : 'te'

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
" tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
