" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldmethod=marker spell:

" Preamble {
"
"  - http://ellengummesson.com/blog/2015/08/01/dropping-ctrlp-and-other-vim-plugins/
"
" }

" Plugins {
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'neomake/neomake'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'myusuf3/numbers.vim'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'

" experimental
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'tpope/vim-unimpaired'

" Initialize plugin system
call plug#end()
" }

" Set pyenvs to use {
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
let g:python_host_prog=$HOME . "/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog=$HOME . "/.pyenv/versions/neovim3/bin/python"
" }

" Basic configuration {
set nospell
set relativenumber
" }

" Plugin Settings {
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:deoplete#enable_at_startup = 1

autocmd! BufWritePost * Neomake
" }

" Mappings {
nnoremap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
map <silent> <leader>r :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo $MYVIMRC 'reloaded'"<CR>

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
