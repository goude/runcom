" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldmethod=marker spell:

" vim configuration. Mappings are shared with neovim, see end of file.

" Initialization / load bundles {
if has('vim_starting')
  set nocompatible
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  au VimEnter * PlugInstall
endif

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif

call plug#begin(expand('~/.vim/plugged'))
Plug 'tpope/vim-sensible'
source ~/.config/nvim/bundles-shared.vim

call plug#end()

filetype plugin indent on

" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
"let g:python_host_prog=$HOME . '/.pyenv/versions/neovim2/bin/python'
"let g:python3_host_prog=$HOME . '/.pyenv/versions/neovim3/bin/python'
"let g:python_host_prog=$HOME . '/bin/neovim-python2'
let g:python3_host_prog=$HOME . '/bin/neovim-python3'
" }

" Load shared init {
if filereadable(expand("~/.config/nvim/init-shared.vim"))
  source ~/.config/nvim/init-shared.vim
endif
" }

" Load shared mappings {
"" Include user's local vim config
if filereadable(expand("~/.config/nvim/mappings.vim"))
  source ~/.config/nvim/mappings.vim
endif
" }

set background=dark
colorscheme gruvbox
