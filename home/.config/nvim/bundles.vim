Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

if v:version >= 703
  Plug 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

"" Color
Plug 'tomasr/molokai'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" erlang
Plug 'jimenezrick/vimerl'

" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" haskell
"" Haskell Bundle
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'
Plug 'pbrisbin/vim-syntax-shakespeare'

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
" Javascript Bundle
"Plug 'jelera/vim-javascript-syntax'

" lisp
"" Lisp Bundle
Plug 'vim-scripts/slimv.vim'

" lua
"" Lua Bundle
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'

" perl
"" Perl Bundle
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'

" php
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'

" python
"" Python Bundle
" Plug 'davidhalter/jedi-vim'

" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

" rust
" Vim racer
Plug 'racer-rust/vim-racer'

" Rust.vim
Plug 'rust-lang/rust.vim'

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
Plug 'ap/vim-buftabline'

" File handling (TODO: unite->denite)
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'

" Coding
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
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
