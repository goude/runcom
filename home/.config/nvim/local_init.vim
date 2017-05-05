" vim: set sw=4 ts=4 sts=4 et tw=78 foldlevel=99 foldmarker={,} foldmethod=marker spell:

" TODO: have a look at http://wrotenwrites.com/a_modern_terminal_workflow_2/
" https://github.com/w0rp/ale (htmlhint and friends also)

" Neovim pyenv paths {
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
let g:python_host_prog=$HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog=$HOME . '/.pyenv/versions/neovim3/bin/python'
" }

" Basic configuration {
"let mapleader = "\\"
let mapleader="\<SPACE>"

set nospell
set relativenumber
" }

" Deoplete / Omnicompletion {
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#jedi#show_docstring = 1

" Experimental (check behavior)
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Experimental
augroup omnifuncs
    autocmd!
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  "enable keyboard shortcuts - <Leader>tn, tr, tR
  "let g:tern_map_keys=1
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>"

" }

" Plugin Settings {

" Base16
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Tagbar
"let g:tagbar_autofocus = 0
"autocmd VimEnter * TagbarOpen

" vimwiki
let g:vimwiki_list = [{'path': '~/wiki', 'syntax': 'markdown', 'ext': '.md'}]

" Neomake
autocmd! BufWritePost * Neomake
"let g:neomake_verbose = 3
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']

let g:neomake_javascript_eslint_maker = {
\ 'args': ['--env', 'es6', '-f', 'compact'],
\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m'
\ }

let g:neomake_error_sign = {'text': 'E', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': 'W', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': 'M', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'I', 'texthl': 'NeomakeInfoSign'}

" vimux
let g:VimuxHeight = '20'
let g:VimuxOrientation = 'h'
let g:VimuxUseNearest = 1
let g:VimuxResetSequence = ''

" lightline
let g:lightline = {
		\ 'colorscheme': 'base16',
		\ }

" }

" Mappings {

" Leader-I - edit certain kinds of files
nnoremap <silent> <leader>ii :e ~/.config/nvim/local_init.vim<CR>
nnoremap <silent> <leader>ik :e ~/.config/nvim/local_bundles.vim<CR>
nnoremap <silent> <leader>ij :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>it :e ~/TODO.md<CR>
nnoremap <silent> <leader>ir :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo $MYVIMRC 'reloaded'"<CR>

" Clear search highlight
nnoremap <silent> <leader>l :<C-u>nohlsearch<cr><C-l>

" Reduce finger movement for Esc
inoremap jk <Esc>

" Arrow keys
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Open previously opened buffer
nmap <Leader><Leader> <c-^>
nnoremap <Leader><Tab> :bnext!<CR>
"nnoremap <C-Left> :bprev!<CR><Paste>

"nmap <Leader><Space>o :lopen<CR>      " open location window
"nmap <Leader><Space>c :lclose<CR>     " close location window
"nmap <Leader><Space>, :ll<CR>         " go to current error/warning
"nmap <Leader><Space>n :lnext<CR>      " next error/warning
"nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Save with Ctrl-s
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>

" Use very magic regexps by default
nnoremap / /\v
cnoremap %s/ %s/\v

" Toggle folds
nmap <leader>z za

" Jump to next Neomake error
nnoremap <leader>ne :ll<CR>

" Fuzzy file finder
nnoremap <silent> <leader>e :FZF -m<CR>

" vim-sneak
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" }

" Workarounds {

" Fix neovim color problems in hyper terminal
" https://github.com/zeit/hyper/issues/364
set termguicolors

"}
