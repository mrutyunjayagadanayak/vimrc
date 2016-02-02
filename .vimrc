set history=700
set autoread
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
set ruler
set ignorecase
set smartcase
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme solarized 
set background=dark
set number
if has("gui_running")
	    set guioptions-=T
	        set guioptions+=e
		    set t_Co=256
		        set guitablabel=%M\ %t
		endif
set complete=.,b,u,]
set nocompatible              " be iMproved, required
filetype off                  " required
let g:clang_library_path="/usr/lib/llvm-3.5/lib" 
let g:neocomplete#enable_at_startup = 1
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
Plugin 'davidhalter/jedi-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required
filetype plugin indent on    " required
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
inoremap {<CR>  {<CR>}<Esc>O
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
set viminfo='10,\"100,:20,%,n~/.viminfo
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Enable the list of buffers
function! ResCur()
	if line("'\"") <= line("$")
	      normal! g`"
	      return 1
	endif
endfunction

augroup resCur
autocmd!
autocmd BufWinEnter * call ResCur()
augroup END
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
map T :TaskList<CR>
map P :TlistToggle<CR>
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"""Error syntex highlight settings start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
"""Error syntex highlight settings end 
"""nerdtree settings start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""Nerdtree settings end

" To open a new empty buffer
" " This replaces :tabnew which I used to bind to this mapping
 map <leader>T :enew<cr>
"
"" Move to the next buffer
map <leader>l :bnext<CR>

" Move to the previous buffer
map <leader>h :bprevious<CR>
"
" " Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
map <leader>bq :bp <BAR> bd #<CR>
" "
" "code to move between splits
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

