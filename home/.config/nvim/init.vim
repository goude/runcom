" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldmethod=marker spell:

" Preamble {
" TODO: have a look at
" - http://wrotenwrites.com/a_modern_terminal_workflow_2/
" - https://github.com/w0rp/ale (htmlhint and friends also)
" - https://github.com/junegunn/dotfiles/blob/master/vimrc
" - https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
"
" - https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
"
"
"
" }

" Initialization / load bundles {
if has('vim_starting')
  set nocompatible
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  au VimEnter * PlugInstall
endif

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

call plug#begin(expand('~/.config/nvim/plugged'))
source ~/.config/nvim/bundles.vim

" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

filetype plugin indent on

" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
let g:python_host_prog=$HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog=$HOME . '/.pyenv/versions/neovim3/bin/python'
" }

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

" Hidden characters
" ¬¦«»¶→⌂⌐⏎⌫⌧∕_
set showbreak=⏎\
set listchars=tab:→\ ,eol:¶,nbsp:_,trail:•,extends:»,precedes:«

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

" Abbreviations {

" Fix common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
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

" }

" Mappings {

" Reduce finger movement for Esc
inoremap jk <Esc>
"inoremap <esc> <nop>
"nnoremap <esc> <nop>

" Arrow keys
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Move up and down visually
nnoremap j gj
nnoremap k gk

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Save with Ctrl-C
noremap <C-s> :w<cr>
inoremap <C-s> <ESC>:w<cr>

" Close buffer with Ctrl-Q
map <C-q> :bd<cr>
imap <C-q> <ESC>:bd<cr>

" Make Y behave
nnoremap Y y$

" qq record, Q replay
nnoremap Q @q

" Use very magic regexps by default
nnoremap / /\v
cnoremap %s/ %s/\v

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Copy/paste mappings

" Yank to system clipboard
noremap <leader>c "+y<CR>

" Paste from system clipboard
noremap <leader>v "+gP<CR>

" Cut to system clipboard
noremap <leader>x "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Vmap for maintaining Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Moving lines
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

nnoremap <Tab> :bnext!<CR>
nnoremap <S-tab> :bprev!<CR>

" vim-sneak
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" vim-easy-align.vim
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Apply macro over visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Disabled Mappings {

" Opens an edit command with the path of the currently edited file filled in
"noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
"noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Open current line on GitHub
"nnoremap <Leader>o :.Gbrowse<CR>

"cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Git
"noremap <Leader>ga :Gwrite<CR>
"noremap <Leader>gc :Gcommit<CR>
"noremap <Leader>gsh :Gpush<CR>
"noremap <Leader>gll :Gpull<CR>
"noremap <Leader>gs :Gstatus<CR>
"noremap <Leader>gb :Gblame<CR>
"noremap <Leader>gd :Gvdiff<CR>
"noremap <Leader>gr :Gremove<CR>

" Session management
"nnoremap <leader>so :OpenSession<Space>
"nnoremap <leader>ss :SaveSession<Space>
"nnoremap <leader>sd :DeleteSession<CR>
"nnoremap <leader>sc :CloseSession<CR>

"nmap <Leader><Space>o :lopen<CR>      " open location window
"nmap <Leader><Space>c :lclose<CR>     " close location window
"nmap <Leader><Space>, :ll<CR>         " go to current error/warning
"nmap <Leader><Space>n :lnext<CR>      " next error/warning
"nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" }

" }

" Mappings - leader/function keys {

" Function key toggles
function! Toggle_msg(tname)
  echom "Toggled" a:tname "."
endfunction

nnoremap <silent> <F1> :call FMLShow()<CR>
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>
nnoremap <silent> <F5> :NumbersToggle<CR>
nnoremap <silent> <leader><F5> :set nonumber<CR>:set norelativenumber<CR>
nnoremap <silent> <F5> :NumbersToggle<CR>
nnoremap <silent> <F6> :TogglePencil<CR>:call Toggle_msg("pencil")<CR>
nnoremap <silent> <F7> mzg=G`z

" Show function key mappings in startup
let g:startify_custom_header = [
  \ '   RUNCOM NVIM',
  \ '',
  \ '   F1 - Leader Help            L-ev Edit nvim config',
  \ '   F2 - NerdTree Find          L-er Reload nvim config',
  \ '   F3 - NerdTree Toggle        L-et Edit todo.txt',
  \ '   F4 - Tagbar Toggle',
  \ '   F5 - Number Toggle',
  \ ' L-F5 - Relativenumber Toggle',
  \ '   F6 - Pencil Toggle',
  \ '   F7 - Indent File',
  \ ]

" Clear search highlight
nnoremap <silent> <leader>l :<C-u>nohlsearch<cr><C-l>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Edit $MYVIMRC
nnoremap <silent> <leader>ev :e $HOMESHICK_REPOS/runcom/home/.config/nvim/init.vim<CR>

" Edit global todo.txt
nnoremap <silent> <leader>et :e $HOMESHICK_REPOS/wiki/todo/todo.txt<CR>

" Reload $MYVIMRC
nnoremap <silent> <leader>er :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo $MYVIMRC 'reloaded'"<CR>

" Surround with "/'
vmap <Leader>" S"
vmap <Leader>' S'
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'

" Open a horizontal split
nnoremap <Leader>- :split<CR>

" Open a vertical split
nnoremap <Leader>\| :vsplit<CR>

" Prepend to all adjacent lines with same indentation - finish with <esc>
nmap <silent> <leader>I ^vio<C-V>I

" Append to all adjacent lines with same indentation - finish with <esc>
nmap <silent> <leader>A ^vio<C-V>$A

" Fuzzy find in buffers
nnoremap <silent> <leader>pb :Buffers<CR>

" Fuzzy find in files
nnoremap <silent> <leader>pp :FZF -m<CR>

" Fuzzy find in git repo
nnoremap <silent> <leader>pg :GitFiles<CR>

" Fuzzy find in git repo
nnoremap <silent> <leader>ph :Helptags<CR>

" Open previously opened buffer
"nmap <Leader><Leader> <c-^>

" Switch to next buffer
nnoremap <Leader><Tab> :bnext!<CR>

" Switch to previous buffer
nnoremap <Leader><S-tab> :bprev!<CR>

" Open WORD under cursor in default program
nnoremap <silent><Leader>o :execute ':!xdg-open ' . shellescape('<cWORD>')<CR>

" }

" Autocommands {

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  au!
  au BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  au!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" Remember Folds (TODO: what else is remembered? / do we need a clear cmd?)
augroup AutoSaveFolds
  au!
  au BufWinLeave *.txt,*.md,*.py,*.vim mkview
  au BufWinEnter *.txt,*.md,*.py,*.vim silent! loadview
augroup END

"" Text files
"augroup vimrc-wrapping
  "au!
  "au BufRead,BufNewFile *.txt call s:setupWrapping()
"augroup END

"" make/cmake
augroup vimrc-make-cmake
  au!
  au FileType make setlocal noexpandtab
  au BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

" }

" Autocommands & language-specific configs {

" c
augroup c_files
  au FileType c setlocal tabstop=4 shiftwidth=4 expandtab
  au FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
augroup END

" go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0

augroup go_files
  au!
  au BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

augroup completion_preview_close
  au!
  if v:version > 703 || v:version == 703 && has('patch598')
    au CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" haskell
let g:haskell_conceal_wide = 1
let g:haskell_multiline_strings = 1
let g:necoghc_enable_detailed_browse = 1

augroup haskell_files
  au!
  au Filetype haskell setlocal omnifunc=necoghc#omnifunc
augroup END

" html
" for html files, 2 spaces
augroup haskell_files
    au!
    au Filetype html setlocal ts=2 sw=2 expandtab
augroup END

" javascript
"let g:javascript_enable_domhtmlcss = 1

" vim-javascript
"augroup vimrc-javascript
  "au!
  "au FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
"augroup END

" python
" vim-python
augroup vimrc-python
  au!
  au FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=80,100
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  au!
  au BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  au FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" Prose / markdown / txt
function! Prose()
  call pencil#init()
  call lexical#init()
  call litecorrect#init()
  call textobj#quote#init()
  call textobj#sentence#init()

  " manual reformatting shortcuts
  "nnoremap <buffer> <silent> Q gqap
  "xnoremap <buffer> <silent> Q gq
  "nnoremap <buffer> <silent> <leader>Q vapJgqap

  " force top correction on most recent misspelling
  "nnoremap <buffer> <c-s> [s1z=<c-o>
  "inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  "setlocal foldlevel=6

  " replace typographical quotes (reedes/vim-textobj-quote)
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>

endfunction

" automatically initialize buffer by file type
" au FileType markdown,mkd,text call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

" }

" Load local configuration {
"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif
" }

" Plugin settings {

" matchup
let g:matchup_matchparen_enabled = 1
let g:matchup_motion_enabled = 1
let g:matchup_text_obj_enabled = 1
let g:matchup_surround_enabled = 1
let g:matchup_transmute_enabled = 1

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Temporarily disabled
" ripgrep
"if executable('rg')
  "let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  "set grepprg=rg\ --vimgrep
  "command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"endif

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" Tagbar
let g:tagbar_autofocus = 1

" Deoplete / omnicompletion {
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
au InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#jedi#show_docstring = 1

" Experimental (check behavior)
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Experimental
augroup omnifuncs
  au!
	au FileType css setlocal omnifunc=csscomplete#CompleteCSS
	au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	au FileType python setlocal omnifunc=pythoncomplete#Complete
	au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern

if exists('g:plugs["tern_for_vim"]')
  "enable keyboard shortcuts - <Leader>tn, tr, tR
  "let g:tern_map_keys=1
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ['tern']
  let g:tern#arguments = ['--persistent']
  let g:tern#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx',
    \ 'vue',
    \ ]
  au FileType javascript setlocal omnifunc=tern#Complete
endif

" tern
au FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>"

" }

" Base16
let g:base16_shell_path = '~/.local/share/base16/templates/shell/scripts'
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Tagbar
"let g:tagbar_autofocus = 0
"au VimEnter * TagbarOpen

" ALE
let g:ale_sign_error = '»'
let g:ale_sign_warning = '•'
let g:ale_lint_delay = 1000
let g:ale_fixers = {
\   'python': [
\      'autopep8',
\      'isort',
\      'yapf'
\   ],
\}

"" Lightline
function! Foobar() abort
  let td = fnamemodify(getcwd(), ":~:.")
  let wd = pathshorten(td)
  return strlen(wd) ? wd : '[No CWD]'
endfunction

"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"if exists("*fugitive#statusline")
  "set statusline+=%{fugitive#statusline()}
"endif

set noshowmode " disabled, since it's displayed by lightline

let g:lightline = {
    \ 'colorscheme': 'base16',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'workdir' ] ],
    \   'right': [ [ 'wordcount', 'lineinfo', 'charvaluehex' ],
    \              [ 'percent' ],
    \              [ 'pencil', 'fileformat', 'fileencoding', 'filetype', ] ]
    \ },
    \ 'component': {
    \   'helloworld': 'Hello, World!',
    \   'charvaluehex': '0x%B'
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'wordcount': 'wordCount#WordCount',
    \   'workdir': 'Foobar',
    \   'pencil': 'PencilMode'
    \ },
    \ }

"" tmux-complete (deoplete needs no trigger)
let g:tmuxcomplete#trigger = ''

"" EditorConfig
" Avoid overriding multi-line indicator already set up
"let g:EditorConfig_max_line_indicator = "none"

"" expand-region
let g:expand_region_text_objects = {
      \ 'iw'  :1,
      \ 'iW'  :1,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :1,
      \ 'ie'  :0,
      \ }

"call expand_region#custom_text_objects({
      "\ "\/\\n\\n\<CR>": 0,
      "\ 'a]' :0,
      "\ 'ab' :0,
      "\ 'aB' :0,
      "\ 'ii' :0,
      "\ 'ai' :0,
      "\ })

"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)

" NERDTree configuration {
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" }

" }

" Workarounds {

" For autoread
" https://stackoverflow.com/questions/2490227/how-does-vims-autoread-work
" From: https://github.com/fphilipe/dotfiles/blob/64c0921d3601edf8c2a59e24097a80f430ad215c/vimrc#L183-L188
"
" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
"au FocusLost,WinLeave * :silent! wa
" (disabled until I've had a chance to think through implications)

" Trigger autoread when changing buffers or coming back to vim.
augroup focus_workaround
  au!
  au FocusGained,BufEnter * :silent! !
augroup END

" Fix neovim color problems in hyper terminal
" https://github.com/zeit/hyper/issues/364
set termguicolors

" Speed up alacritty on OSX
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Override search highlights
" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
set hlsearch
hi! Search guifg=lightgrey guibg=236 ctermfg=lightgrey ctermbg=236
hi! IncSearch guifg=lightgrey guibg=236 ctermfg=lightgrey ctermbg=236

hi! MatchParen guibg=#3a3a3a
hi! Sneak guibg=#3a3a3a
hi! SneakScope guibg=#3a3a3a

"au ColorScheme * hi MatchWord guifg=lightgrey guibg=grey ctermfg=lightgrey ctermbg=grey
"au ColorScheme * hi MatchParenCur guifg=lightgrey guibg=grey ctermfg=lightgrey ctermbg=grey
"au ColorScheme * hi MatchWordCur guifg=lightgrey guibg=grey ctermfg=lightgrey ctermbg=grey

" Allow crontab editing
set backupskip=/tmp/*,/private/tmp/*

" Make yaml front matter in notes look like a comment
augroup notes_yaml
  au!
  au BufNewFile,BufRead */notes/*.md syntax match Comment /\%^---\_.\{-}---$/
augroup END
"}

" Whitespace Warnings {

" Credit: krader1961 in https://github.com/tpope/vim-sleuth/issues/13
" Highlight trailing whitespace and leading mixed tabs/spaces.
" TODO: highlight space indents if noexpandtab is set
hi! ExtraWhitespaceWarn ctermbg=darkred guibg=darkred
augroup whitespace_warnings
  au!
  au ColorScheme * highlight! ExtraWhitespaceWarn ctermbg=darkred guibg=darkred
  au BufWinEnter * match ExtraWhitespaceWarn /\v^\s*( \t|\t )\s*|\s+$/

  " The above flashes annoyingly while typing, be calmer in insert mode
  "au InsertLeave * match ExtraWhitespaceWarn /\v^\s*( \t|\t )\s*|\s+$/
  "au InsertEnter * match ExtraWhitespaceWarn /\s\+\%#\@<!$/
augroup END

" }
