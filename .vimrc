" Load pathogen
execute pathogen#infect()
call pathogen#helptags()

" because swap files are annoying
set noswapfile

" Use wildmenu for everything
set wildmenu
set wildmode=list:longest,full

" Use dark solarized for colorscheme, Monaco:h12 for font (good on OSX)
set background=dark
colorscheme solarized
set guifont=Monaco:h12

"Line numbering
set number

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
" vnoremap <C-X> "+x

" CTRL-C is Copy
" vnoremap <C-C> "+y

" CTRL-V is Paste
" map <C-V> "+gP
" cmap <C-V> <C-R>+

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

" Set CtrlP to use regexp by default
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = 'rw'

" Map F4 to :buffers
:nnoremap <F4> :buffers<CR>:buffer<Space>

" Bind netrw explore to @e
let @e=':Ex'

"set statusline +=%{fugitive#statusline()} " Add git status to statusline

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

" Always show statusline, even with one window
set laststatus=2

" Using the C command clears the search highlighting
:command C let @/=""

" Remove lefthand scrollbar in gVim. This fixes the cursor disappearing bug in ubuntu
set guioptions-=L

" Set all file encodings to utf-8
set fileencodings=utf-8

" If search is uppercase, case sensitive, otherwise ignore case
set ignorecase smartcase

" Show cursor location
set ruler

" close buffer without closing window with F2
nnoremap <F2> :bp<bar>sp<bar>bn<bar>bd<CR>

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" use the coffeescript plugin for litcoffee
autocmd FileType litcoffee runtime ftplugin/coffee.vim

" show syntax highlighting on terminal vim
syntax on
set term=builtin_ansi

" max history
set history=10000

" prepopulate vimgrep
" nnoremap <F3> :noautocmd vimgrep //j <left><left><left>
" nnoremap <F4> :noautocmd vimgrep /<C-R><C-W>/j <bar>cw<left><left><left>
" vnoremap <unique> <F4> y:noautocmd vimgrep /<c-r>"/j <bar>cw<left><left><left>

nnoremap <F3> :Ack '' --type=<left><left><left><left><left><left><left><left><left><left>
nnoremap <F4> :Ack '<C-R><C-W>' --type=
vnoremap <unique> <F4> y:noautocmd vimgrep /<c-r>"/j <bar>cw<left><left><left>

" ,e command will do :e on the current directory
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" don't immediately autocomplete when I hit ctrl n, let me see options first
set completeopt=longest,menuone

" don't search multiple times in folded text
set fdo-=search

" EASYMOTION CONFIG
" map comma as leader key
let mapleader=","

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  ? <Plug>(easymotion-sn)
omap ? <Plug>(easymotion-tn)

" Set smartcase for easymotion
let g:EasyMotion_smartcase = 1

" Use easymotion directional keys

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
