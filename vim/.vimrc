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
set hlsearch

let mapleader = " "
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
nnoremap <C-down> <C-e>
nnoremap <C-up> <C-y><up>
" Window movement
nnoremap wq <c-w>q
nnoremap wh <c-w>h
nnoremap w<left> <c-w>h
nnoremap wj <c-w>j
nnoremap w<down> <c-w>j
nnoremap wk <c-w>k
nnoremap w<up> <c-w>k
nnoremap wl <c-w>l
nnoremap w<right> <c-w>l

" Listing buffers
nnoremap <tab> :buffers<CR>:buffer<Space>
" Buffer quickswitch
nnoremap <leader>b :b#<CR>

" Automatic toggling of hybrid line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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
set background=dark
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
highlight LineNr ctermfg = 7
highlight ColorColumn ctermbg = 7

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.space = "\ua0"
let g:airline_theme="jellybeans"
let g:airline_skip_empty_sections=1

" netrw
let g:netrw_liststyle = 0 " Tree mode. 0=thin, 1=long, 2=wide
let g:netrw_banner = 0 " Disable banner
let g:netrw_browse_split = 4 " Open files in vertical split. 1=h split, 3=new tab, 4=prev window
let g:netrw_winsize = 25 " Set width to 25% of page
let g:netrw_list_hide = &wildignore
" Open netrw in leftmost window
function! ToggleNetrw()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
nnoremap <leader>t :call ToggleNetrw()<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call ToggleNetrw() | endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_config_file=".syntastic_c_config"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = {
	\ "mode": "active",
	\ "passive_filetypes": ["asm"]
\ }

" Gitgutter
set updatetime=100
let g:gitgutter_realtime=0
let g:gitgutter_eager=0

" Filetype-specific
autocmd FileType c setlocal expandtab shiftwidth=4 autoindent
autocmd FileType asm setlocal expandtab shiftwidth=4 autoindent tabstop=4

" Tagbar
nnoremap <leader>l :TagbarToggle<cr>

" Hex mode
nnoremap <leader>h :%!xxd<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ctrlp
let g:ctrlp_custom_ignore = "zig-cache"

" vim-localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

" Enable true color support.
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Zig
let g:zig_fmt_autosave = 0
