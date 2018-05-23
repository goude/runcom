
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

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

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" Leader-I - edIt certain kinds of files
nnoremap <silent> <leader>ii :e $HOMESHICK_REPOS/runcom/home/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>it :e $HOMESHICK_REPOS/wiki/todo/todo.txt<CR>
nnoremap <silent> <leader>ir :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo $MYVIMRC 'reloaded'"<CR>

" Toggles
nnoremap <leader>tt :TagbarToggle<CR>

" Clear search highlight
nnoremap <silent> <leader>l :<C-u>nohlsearch<cr><C-l>

" Reduce finger movement for Esc
inoremap jk <Esc>

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

" Splits - same mappings as in tmux
nnoremap <Leader>- :split<CR>
nnoremap <Leader>\| :vsplit<CR>

" Open previously opened buffer
"nmap <Leader><Leader> <c-^>

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :TagbarToggle<CR>

" Switch buffers with Tab
nnoremap <Leader><Tab> :bnext!<CR>
nnoremap <Leader><S-tab> :bprev!<CR>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-tab> :bprev!<CR>

"nmap <Leader><Space>o :lopen<CR>      " open location window
"nmap <Leader><Space>c :lclose<CR>     " close location window
"nmap <Leader><Space>, :ll<CR>         " go to current error/warning
"nmap <Leader><Space>n :lnext<CR>      " next error/warning
"nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Save with Ctrl-C
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>

" Close buffer with Ctrl-Q
map <C-q> :bd<cr>
imap <C-q> <ESC>:bd<cr>

" Make Y behave
nnoremap Y y$

" qq record, Q replay
nnoremap Q @q

" Prepend/Append to all adjacent lines with same indentation
nmap <silent> <leader>I ^vio<C-V>I
nmap <silent> <leader>A ^vio<C-V>$A

" Use very magic regexps by default
nnoremap / /\v
cnoremap %s/ %s/\v

" Fuzzy file finder
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>p :FZF -m<CR>
nnoremap <silent> <leader>e :GitFiles<CR>

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
