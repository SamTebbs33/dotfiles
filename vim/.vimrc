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

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE guibg=#0D61AC guifg=white
    hi! BuffetBuffer cterm=NONE guibg=#151515 guifg=white
    hi! BuffetTab cterm=NONE guibg=#151515 guifg=white
endfunction

execute pathogen#infect()
set number
set numberwidth=1
syntax on
filetype plugin indent on
Helptags
set visualbell
set hlsearch
set encoding=utf8
set guifont=Source\ Code\ Pro\ For\ Powerline\ 11
set shiftwidth=4
set tabstop=4
set expandtab

let mapleader = " "
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <leader>b :bd<CR>
nnoremap <leader>s :%s/
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader>c "*yy
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>:call WriteBackup()<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>f :Autoformat<CR>
nnoremap <leader>e :e!<CR>
" Search for selected text
vnoremap <leader>/ y/<C-r>"
vnoremap <leader>s y:%s/<C-r>"
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
" Window resizing
nnoremap w- :vertical res -5<enter>
nnoremap w= :vertical res +5<enter>
" Map U to redo
noremap U <C-R>
" Map // to search for selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Fuzzy finding
set path=**
nnoremap <leader>f :find 

" Paste without overwriting the default register
vnoremap p "_dP

" Match angled brackets too
set matchpairs+=<:>

" Possibly fast syntax highlighting with the old regex engine
set re=1

" Listing buffers
" nnoremap <tab> :buffers<CR>:buffer<Space>
" Buffer quickswitch
" nnoremap <leader>b :b#<CR>

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
autocmd BufEnter ~/dotfiles/i3/.config/i3/config.i3config set ft=i3config

" Change vim shell to the standard shell
if &shell =~# 'fish$'
  set shell=sh
endif

set wildignore+=*.o,zig-cache

" Colourscheme
let g:jellybeans_background_color = "#000000"
colorscheme jellybeans
set background=dark

set termguicolors
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
" Open netrw if no files were specified in the cmd line
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call ToggleNetrw() | endif

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
autocmd FileType c setlocal expandtab shiftwidth=4 tabstop=4 autoindent
autocmd FileType cpp setlocal expandtab shiftwidth=4 tabstop=4 autoindent
autocmd FileType verilog setlocal expandtab shiftwidth=4 tabstop=4 autoindent
autocmd FileType asm setlocal expandtab shiftwidth=4 tabstop=4 autoindent

" Tagbar
nnoremap <leader>l :TagbarToggle<cr>
let g:airline#extensions#tagbar#enabled = 1

" Hex mode
nnoremap <leader>h :%!xxd<cr>

" vim-localvimrc
"let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
set exrc

" Enable true color support.
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Zig
let g:zig_fmt_autosave = 1

" Persistent undo
set undofile
set undodir=~/.vim/undo-dir

" Snippets
fun! InsertSnippet(name)
  silent exe ":-1read ~/.vim/snippets/" . a:name . ".*"
endfun
" insert a snippet by name
nnoremap ; :call InsertSnippet("")<Left><Left>
" find the next snippet parameter to replace and substitute it
nnoremap # /@@<CR>gns

" vim-buffet
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

let g:buffet_max_plug = 10
let g:buffet_always_show_tabline = 0
let g:buffet_powerline_separators = 0
let g:buffet_show_index = 1
let g:buffet_new_buffer_name = "?"
let g:buffet_modified_icon = "*"
let g:buffet_tab_icon = "/"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

nnoremap <tab> :b#<CR>

" ale
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'cpp': ['clangd']
\}
let g:ale_echo_msg_format="[%linter%]: %s"
nnoremap <silent> <leader>[ :ALEPreviousWrap<CR>
nnoremap <silent> <leader>] :ALENextWrap<CR>
let g:ale_c_parse_compile_commands=1

" Write a backup of the current file to ~/.vim/bkp/%
fun! WriteBackup()
  let fname =  "".expand("%:t") . ".bkp"
  silent exe ":!cp % ~/.vim/bkp/" . fname
endfun
