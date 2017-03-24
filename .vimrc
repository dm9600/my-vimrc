" Load pathogen
execute pathogen#infect()
call pathogen#helptags()

set nocompatible

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

" folding settings
set foldmethod=indent   "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" use the coffeescript plugin for litcoffee
autocmd FileType litcoffee runtime ftplugin/coffee.vim

" show syntax highlighting on terminal vim
syntax on
set term=builtin_ansi

" max history
set history=10000

" map space as leader key
let mapleader=" "

" prepopulate vimgrep
" nnoremap <F3> :noautocmd vimgrep //j <left><left><left>
" nnoremap <F4> :noautocmd vimgrep /<C-R><C-W>/j <bar>cw<left><left><left>
" vnoremap <unique> <F4> y:noautocmd vimgrep /<c-r>"/j <bar>cw<left><left><left>

" close buffer without closing window with F1
nnoremap <F1> :%s///gc<left><left><left><left>
vnoremap <unique> <F1> y:%s/<C-R><C-W>//gc<left><left><left>

let s:prevFileType = ""
function! AckThis(str)
  if len(a:str) == 0
    let l:str = input("Enter search string: ", "")
    let quoted = "'" . l:str . "'"
  else
    let l:str = a:str
  endif

  if len(l:str) == 0
    return
  endif

  let quoted = "'" . l:str . "'"
  let l:ft = input("Enter file type: ")

  if len(l:ft) == 0
    let typed = "--type=" . s:prevFileType
  else
    let typed = "--type=" . l:ft
    let s:prevFileType = l:ft
  endif

  if len(typed) == 7
    return
  endif

  execute "Ack!" quoted typed
endfunction

" nnoremap <F2> :Ack '' --type=c<left><left><left><left><left><left><left><left><left><left>
nnoremap <F2> :Ack --
nnoremap <F3> :YcmCompleter GoToDefinition
" vnoremap <F2> :call AckThis("<C-R><C-W>")<CR>
" nnoremap <F2> :call AckThis("")<CR>
" nnoremap <F3> :GitGutterToggle <CR>

" coffeescript specific keybinds
" Easily find javascript methods
map <F5> <Plug>(easymotion-sn).*.*:<left><left><left>
" Easily find describe methods
map <F6> <Plug>(easymotion-sn)describe '.*'<left><left><left>
nnoremap <F7> :call DeleteExtras()<CR>

" ,e command will do :e on the current directory
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" don't immediately autocomplete when I hit ctrl n, let me see options first
set completeopt=longest,menuone

" don't search multiple times in folded text
set fdo-=search

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Set smartcase for easymotion
let g:EasyMotion_smartcase = 1

" Use easymotion directional keys
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
nmap - <Plug>(choosewin)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

" Keep visual mode selection when indenting
vnoremap > >gv
vnoremap < <gv

" Remap switch window to use leader key
nnoremap <C-c> <C-^>

function! DeleteExtras()
  :g/console\|debugger/d
  if match(join(getline(1,'$'), "\n"), "\.only") != -1
    :%s/\.only//g
  endif
endfunction

function! ConsoleLog()
  let cw = expand("<cword>")
  exec "normal! ^iconsole.log '"
  exec "normal! $a'"
  exec "normal! oconsole.log JSON.stringify(" . cw
  exec "normal! a, undefined, 2)"
endfunction

nnoremap @l :call ConsoleLog()<CR>

" Disable git gutter signs
let g:gitgutter_enabled = 0

" Treat all numerals as decimal
set nrformats=

" organize imports for go
let g:syntastic_javascript_checkers = ['eslint']

" go specific
autocmd FileType go setlocal shiftwidth=8 tabstop=8

" auto start indent guides
" autocmd VimEnter * IndentGuidesEnable

" don't echo rooter directory changes
let g:rooter_silent_chdir = 1

" don't ask each time for loading a lvimrc
let g:localvimrc_ask=0

" http://superuser.com/a/553775/253897
set selection=exclusive
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'path_html':'~/Dropbox/vimwiki/html/'}]
imap <C-j> <Plug>snipMateNextOrTrigger
:imap <C-j> <Plug>snipMateNextOrTrigger

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
set history=1000
