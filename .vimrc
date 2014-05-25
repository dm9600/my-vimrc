" Load pathogen
execute pathogen#infect()
call pathogen#helptags()

set noswapfile

" Use wildmenu for everything
set wildmenu
set wildmode=list:longest,full

colorscheme desert
set guifont=Monaco:h12

"Line numbering
set number

"Set working directory to current directory always
set autochdir

" Don't save when switching buffers
set hidden

" This shows what you are typing as a command.
set showcmd

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
exe 'inoremap <script> <D-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <D-V>' paste#paste_cmd['v']

" Set mappings for insert mode and visual mode
imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Set CtrlP to MRU mode by default
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

" Map F5 to :buffers
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Map j and k to gj and gk for better line wrapping support
:map j gj
:map k gk

" Set tab to 2 space
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Stop showing @ symbols when when the line doesn't fit on screen
set display+=lastline

" Using the C command clears the search highlighting
:command C let @/=""

" Remove lefthand scrollbar in gVim. This fixes the cursor disappearing bug in ubuntu
set guioptions-=L

" Set all file encodings to utf-8
set fileencodings=utf-8

" If search is uppercase, case sensitive, otherwise ignore case
:set ignorecase
:set smartcase

" Show cursor location
:set ruler

" close buffer without closing window with F5
nnoremap <F5> :bp<bar>sp<bar>bn<bar>bd<CR>
