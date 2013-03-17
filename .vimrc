set backupdir-=.
set backupdir^=~/tmp,/tmp
set ts=4
set wildmenu
set wildmode=list:longest,full
set number

" This shows what you are typing as a command.  I love this!
set showcmd

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3

" Enable mouse support in console
" set mouse=a

" Ignoring case is a fun trick
set ignorecase

" When I close a tab, remove the buffer
set nohidden

" Set word wrapping
set linebreak

" Use filetype specific indentation
filetype on
filetype plugin on
filetype indent on
