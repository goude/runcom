" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldmethod=marker spell:

" Set pyenvs to use {
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
let g:python_host_prog=$HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog=$HOME . '/.pyenv/versions/neovim3/bin/python'
" }

" Basic configuration {
let mapleader = "\\"
set nospell
set relativenumber
" }

" Plugin Settings {
if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:deoplete#enable_at_startup = 1

autocmd! BufWritePost * Neomake

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
nnoremap <silent> <leader>ii :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>if :e ~/.config/nvim/fork_init.vim<CR>
map <silent> <leader>ir :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo $MYVIMRC 'reloaded'"<CR>

noremap <silent> <leader>l :<C-u>nohlsearch<cr><C-l>
inoremap <silent> <leader>l <C-o>:nohlsearch<cr>

" Reduce finger movement for Esc
inoremap jk <Esc>

" Switch between buffers
map <up> :bp<CR>
map <down> :bn<CR>

" Save with Ctrl-s
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>

" Use very magic regexps by default
nnoremap / /\v
cnoremap %s/ %s/\v

" Toggle folds
nmap <Space> za

" }

" Workarounds {

" Fix neovim color problems in hyper terminal
" https://github.com/zeit/hyper/issues/364
set termguicolors

"}
