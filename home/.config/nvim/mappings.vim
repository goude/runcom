" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldmethod=marker spell:

" These mappings are shared between nvim (plugin-heavy) and vim (tpope's sensible
" defaults, not much more). Only put cross-compatible mappings here.

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

" Make Y behave like D and C
nnoremap Y y$

" qq record, Q replay
nnoremap Q @q

" Use very magic regexps by default
nnoremap / /\v
cnoremap %s/ %s/\v

" Center keyword when moving to next/previous search hit
nnoremap n nzzzv
nnoremap N Nzzzv

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


" Clear search highlight
nnoremap <silent> <Leader>l :<C-u>nohlsearch<cr><C-l>

" Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" Open previously opened buffer
"nmap <Leader><Leader> <c-^>

" Switch to next buffer
nnoremap <Leader><Tab> :bnext!<CR>

" Switch to previous buffer
nnoremap <Leader><S-tab> :bprev!<CR>

" Open WORD under cursor in default program
nnoremap <silent><Leader>o :execute ':!xdg-open ' . shellescape('<cWORD>')<CR>

" Open a horizontal split
nnoremap <Leader>- :split<CR>

" Open a vertical split
nnoremap <Leader>\| :vsplit<CR>

" Prepend to all adjacent lines with same indentation - finish with <esc>
nmap <silent> <Leader>I ^vio<C-V>I

" Append to all adjacent lines with same indentation - finish with <esc>
nmap <silent> <Leader>A ^vio<C-V>$A

" Insert timestamp in ISO8601 format
nnoremap <Leader>ts "=strftime("%FT%T%z")<CR>P


" Surround with quotes
" TODO: consider doing `set iskeyword+=.` for certain filetypes.
vmap <Leader>" S"
nmap <Leader>" ysiw"
vmap <Leader>' S'
nmap <Leader>' ysiw'
vmap <Leader>` S`
nmap <Leader>` ysiw`
nmap <Leader>~ ysiW`

" Fuzzy find
nnoremap <silent> <leader>pb :Buffers<CR>
nnoremap <silent> <leader>pg :GitFiles<CR>
nnoremap <silent> <leader>ph :Helptags<CR>
nnoremap <silent> <leader>pp :FZF -m<CR>

" Toggles
nnoremap <Leader>tp :TogglePencil<CR>:call DisplayMessage("Toggled pencil mode.")<CR>
nnoremap <Leader>tn :NumbersToggle<CR>
nnoremap <Leader>tr :NERDTreeToggle<CR>
nnoremap <Leader>tt :TagbarToggle<CR>

" Editing
nnoremap <Leader>ei mzg=G`z
nnoremap <Leader>ea :ALEFix<CR>
vnoremap <Leader>es :sort<CR>

" }

" Copy/paste mappings {

" Yank to system clipboard
noremap <Leader>c "+y<CR>

" Paste from system clipboard
noremap <Leader>v "+gP<CR>

" Cut to system clipboard
noremap <Leader>x "+x<CR>

" Replace word under cursor in buffer (with /g)
nnoremap <leader>ss :%s/\<<C-r><C-w>\>//g<Left><Left>

" }

" EasyMotion minimal mappings {
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" }

" Disabled Mappings {

" Apply macro over visual selection
"xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

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
"nnoremap <Leader>so :OpenSession<Space>
"nnoremap <Leader>ss :SaveSession<Space>
"nnoremap <Leader>sd :DeleteSession<CR>
"nnoremap <Leader>sc :CloseSession<CR>

"nmap <Leader><Space>o :lopen<CR>      " open location window
"nmap <Leader><Space>c :lclose<CR>     " close location window
"nmap <Leader><Space>, :ll<CR>         " go to current error/warning
"nmap <Leader><Space>n :lnext<CR>      " next error/warning
"nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" }

