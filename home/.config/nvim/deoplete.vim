" Deoplete / omnicompletion {
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
au InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#auto_complete_delay = 100

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
