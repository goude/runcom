" basic plugins
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'myusuf3/numbers.vim'
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'

" Git
Plug 'junegunn/gv.vim'

" colors - base16
"Plug 'chriskempson/base16-vim'
Plug '~/.local/share/base16/templates/vim'

" Status line
Plug 'itchyny/lightline.vim'
"Plug 'daviesjamie/vim-base16-lightline'
Plug 'ap/vim-buftabline'

" File handling (TODO: unite->denite)
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'

" Coding
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'neomake/neomake'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'zchee/deoplete-jedi'

" Show register contents (C-R in insert mode)
Plug 'junegunn/vim-peekaboo'

" Javascript plugins
" https://github.com/vimlab/neojs
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'

" Typescript plugins
"Plug 'Shougo/vimproc'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'mhartington/vim-typings'
Plug 'Quramy/ng-tsserver'

" Experimental - can be disabled if needed
Plug 'severin-lemaignan/vim-minimap'

" Your own wiki
"Plug 'vimwiki/vimwiki'

" Text editing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'

" table editing
Plug 'dhruvasagar/vim-table-mode'

" word count
Plug 'ChesleyTan/wordCount.vim'

" todo.txt (my fork)
Plug 'goude/todo.txt-vim'

" TODO
" https://github.com/ivanov/vim-ipython/
" https://github.com/kana/vim-arpeggio
