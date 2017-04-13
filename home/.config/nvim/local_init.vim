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

" Plugin Settings {

" Base16
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
" Experimental (check behavior)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Neomake
autocmd! BufWritePost * Neomake

" Tagbar
"let g:tagbar_autofocus = 0
"autocmd VimEnter * TagbarOpen

" vimwiki
let g:vimwiki_list = [{'path': '~/wiki', 'syntax': 'markdown', 'ext': '.md'}]

let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
 \   'text': '',
 \   'texthl': 'NeomakeWarningSign',
 \ }
let g:neomake_message_sign = {
  \   'text': '►',
  \   'texthl': 'NeomakeMessageSign',
  \ }
let g:neomake_info_sign = {'text': '•', 'texthl': 'NeomakeInfoSign'}

" }

" Mappings {
nnoremap <silent> <leader>ii :e ~/.config/nvim/local_init.vim<CR>
nnoremap <silent> <leader>ij :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>ir :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo $MYVIMRC 'reloaded'"<CR>

" Clear search highlight
nnoremap <silent> <leader>l :<C-u>nohlsearch<cr><C-l>

" Reduce finger movement for Esc
inoremap jk <Esc>

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

" Switch between buffers
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

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
