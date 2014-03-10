" Misc stuff to make things better on windows
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Pathogen
execute pathogen#infect()
execute pathogen#helptags()

" Disable swap files
set noswapfile

" Automatically restore default session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

" Start using MRU mode
let g:ctrlp_cmd = 'CtrlPMRUFiles'

" Automatically change directory
set autochdir

" Change backup directory
set backupdir=C:\\tmp
set linebreak

colorscheme desert

"set guifont=IBM3270:h12
set guifont=Consolas:h10:cANSI
set number

" Set ruby path manually
let g:ruby_path = ':C:\ruby192\bin'

" Stuff from github:
set ts=4
set wildmenu
set wildmode=list:longest,full
set number

" This shows what you are typing as a command. I love this!
set showcmd

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab? Not me!
set shiftwidth=2
set softtabstop=2

" Enable mouse support in console
" set mouse=a

" Ignoring case is a fun trick
set ignorecase

" When I close a tab, remove the buffer
set hidden

" Set word wrapping
set linebreak

" Use filetype specific indentation
filetype on
filetype plugin on
filetype indent on

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y

" CTRL-V and SHIFT-Insert are Paste
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

" Map NERDTree to ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Map F5 to :buffers
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Map j and k to gj and gk for better line wrapping support
:map j gj
:map k gk

" Stop showing @ symbols when when the line doesn't fit on screen
set display+=lastline

" Using the C command clears the search highlighting
:command L let @/=""
