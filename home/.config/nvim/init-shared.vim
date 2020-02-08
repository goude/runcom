" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldmethod=marker spell:

" Basic setup {
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overwriten by au rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" leader keys
let maplocalleader = "\\"
let mapleader="\<SPACE>"

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Experimental: Change to current files directory
" set autochdir " may interfere with some plugins

if has('persistent_undo')
    set undodir=~/.undodir/
    set undofile
endif

set nospell

set autoread

" Hidden characters
" ¬¦«»¶→⌂⌐⏎⌫⌧∕_
set showbreak=⏎\
" set listchars=tab:→\ ,eol:¶,nbsp:_,trail:•,extends:»,precedes:«
set listchars=tab:→\ ,nbsp:_,trail:•,extends:»,precedes:«
" set list


" Disable visualbell
set noerrorbells visualbell t_vb=
if has('au')
  au GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" }

" Visual settings {
syntax on
set ruler

" Numbering
set number
set relativenumber

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 0
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" }

" Functions {

"if !exists('*s:setupWrapping')
  "function s:setupWrapping()
    "set wrap
    "set wm=2
    "set textwidth=79
  "endfunction
"endif

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! DisplayMessage(tname)
  echom "MSG: " a:tname ""
endfunction

" }

" Show function key mappings in startup
let g:startify_custom_header = readfile(expand('~/.config/nvim/start_message.txt'))

