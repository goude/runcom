" reset defaults
Plug 'tpope/vim-sensible'

" basic plugins
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'myusuf3/numbers.vim'
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'

" colors - base16
"Plug 'chriskempson/base16-vim'
Plug '~/.local/share/base16/templates/vim'

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

" Your own wiki
Plug 'vimwiki/vimwiki'

" Emojis
Plug 'junegunn/vim-emoji'

" Text editing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
