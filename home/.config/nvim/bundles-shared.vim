" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldmethod=marker spell:

" These bundles are shared between vim and nvim.
"
" Here's a list, should we ever need to install even more plugins:
" https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md

" Base {

" Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-repeat'

" Color schemes
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" Comment functions so powerful—no comment necessary.
Plug 'scrooloose/nerdcommenter'

" Massive collection of syntax highlighting / ftdetect / indent plugins
Plug 'sheerun/vim-polyglot'

Plug 'nanotech/jellybeans.vim'
" Base16 color schemes - use locally generated
"Plug 'chriskempson/base16-vim'
Plug '~/.local/share/base16/templates/vim'

" Fancy start screen for vim
Plug 'mhinz/vim-startify'

"Plug 'tpope/vim-unimpaired'
" }
