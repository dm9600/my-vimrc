" Load pathogen
execute pathogen#infect()
call pathogen#helptags()

set noswapfile

" Use wildmenu for everything
set wildmenu
set wildmode=list:longest,full

"Line numbering
set number

colorscheme evening

"Set working directory to current directory always
set autochdir

" Don't save when switching buffers
set hidden

" This shows what you are typing as a command.
set showcmd

set autoindent

" Use tab characters, and set a 2 space tab length
set tabstop=2
set autoindent

" Enable mouse support in console
set mouse=a

" When I close a tab, remove the buffer
set nohidden

" Set word wrapping
set linebreak

" Use filetype specific indentation
filetype on
filetype plugin on
filetype indent on

" disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" CTRL-X is Cut
vnoremap <C-X> "+x

" CTRL-C is Copy
vnoremap <C-C> "+y

" CTRL-V is Paste
map <C-V> "+gP
cmap <C-V> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Set CtrlP to MRU mode by default
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
