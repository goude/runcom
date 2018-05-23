" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'myusuf3/numbers.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/CSApprox'
Plug 'vim-scripts/grep.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'tomasr/molokai'

" FZF integration
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

" Async helpers (needed?)
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"The vim-session plug-in improves upon Vim's built-in |:mksession| command by
"enabling you to easily and (if you want) automatically persist and restore
"your Vim editing sessions.
Plug 'xolox/vim-misc' " helpers for vim-session
Plug 'xolox/vim-session'

" *vimshell* is an extreme shell that doesn't depend on external shells but is
" written completely in pure Vim script.
Plug 'Shougo/vimshell.vim'

" UltiSnips provides snippet management for the Vim editor. A snippet is a
" short piece of text that is either re-used often or contains a lot of
" redundant text. UltiSnips allows you to insert a snippet with only a few key
" strokes.
Plug 'SirVer/ultisnips'

" This repository contains snippets files for various programming languages.
" It is community-maintained and many people have contributed snippet files and
" other improvements already.
Plug 'honza/vim-snippets'

" A git commit browser.
Plug 'junegunn/gv.vim'

" Base16 color schemes - use locally generated
"Plug 'chriskempson/base16-vim'
Plug '~/.local/share/base16/templates/vim'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" A well-integrated, low-configuration buffer list that lives in the tabline
Plug 'ap/vim-buftabline'

" TODO: Active development on unite.vim has stopped. The only future changes will be
" bug fixes. Please see Denite.nvim.
"
" The unite or unite.vim plug-in can search and display information from
" arbitrary sources like files, buffers, recently used files or registers. You
" can run several pre-defined actions on a target displayed in the unite
" window.
Plug 'shougo/unite.vim'

" A powerful file explorer implemented in Vim script.
Plug 'shougo/vimfiler.vim'

" Comment functions so powerful—no comment necessary.
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

Plug 'wellle/tmux-complete.vim'
Plug 'terryma/vim-expand-region'
Plug 'wellle/targets.vim'
Plug 'coderifous/textobj-word-column.vim'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" erlang
Plug 'jimenezrick/vimerl'

" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" haskell
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'
Plug 'pbrisbin/vim-syntax-shakespeare'

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" lisp
Plug 'vim-scripts/slimv.vim'

" lua
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'

" perl
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'

" php
Plug 'arnaud-lb/vim-php-namespace'

" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

" rust
" Vim racer
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" TODO
" https://github.com/ivanov/vim-ipython/
" https://github.com/kana/vim-arpeggio

Plug 'schickling/vim-bufonly'
Plug 'kshenoy/vim-signature'

" Should be loaded last, according to instructions
Plug 'ryanoasis/vim-devicons'

