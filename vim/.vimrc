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
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set completeopt=preview,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
Helptags
set visualbell
set confirm
set paste
set hlsearch

let &path.="src/include,/usr/include/AL,"

let mapleader = " "
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

" IndentLines
let g:indentLine_color_tty_light = 7
let g:indentLine_color_tty_dark = 1

" Recommended settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Indent guides plugin
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Enabling vim-airline status bar
let g:airline_theme='hybrid'
set laststatus=2
set ttimeoutlen=50

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" UltiSnips stuff
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Colour schemes
"colorscheme hybrid_material
color jellybeans
set background=dark
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
highlight LineNr ctermfg=7

" NERDTree
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"	: "~",
			\ "Staged"		: "s",
			\ "Untracked"	: "/",
			\ "Renamed"		: "r",
			\ "Unmerged"	: "",
			\ "Deleted"		: "-",
			\ "Dirty"		: "*",
			\ "Clean"		: "",
			\ "Unknown"		: "?"
			\ }
map <leader>t :NERDTreeToggle<CR>
function! NtHlFile(ext, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:ext . ' ctermbg=' . a:bg . ' ctermfg=' . a:fg . ' guibg=' . a:guibg . ' guifg=' . a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:ext . ' #^\s\+.*' . a:ext . '$#'
endfunction

call NtHlFile("md", "blue", "none", "#3366FF", "#151515")
call NtHlFile("vim", "cyan", "none", "cyan", "#151515")

" Buffer things
au BufAdd,BufNewFile * nested tab sball
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <leader>b :bp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>l :ls<CR>

" Change swap
if has("win32") || has("win64")
	set directory=$TMP
else
	set directory=/tmp
end

" Vim exec
let g:vim_exec_clear = 1
let g:vim_exec_vimux = 0

" Set filtype when opening i3 config
autocmd BufEnter ~/dotfiles/i3/.config/i3/config set ft=i3config

" Change vim shell to the standard shell
if &shell =~# 'fish$'
	set shell=sh
endif

" GHC Mod stuff
let $PATH = $PATH . ':' . expand('~/.cabal/bin')
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
