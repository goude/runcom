" Vim syntax file
" Language: mintodo

"if exists("b:current_syntax")
  "finish
"end

"setlocal iskeyword+=.
"setlocal iskeyword+=/
"setlocal iskeyword+=[
"setlocal iskeyword+=]

syn match mtdComment '^vim:.*$'
syn match mtdComment '{{'
syn match mtdComment '}}'
syn match mtdComment '\['
syn match mtdComment '\]'

syn match mtdTime '\d\d:\d\d'
syn match mtdTime '^\d\d\d\d-\d\d-\d\d'

syn match mtdCheck 'X'

"syn match ngxVariable '\$\w\w*'
"syn match ngxVariableBlock '\$\w\w*' contained
"syn match ngxVariableString '\$\w\w*' contained
"syn region ngxBlock start=+^+ end=+{+ contains=ngxComment,ngxDirectiveBlock,ngxVariableBlock,ngxString oneline
"syn region ngxString start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=ngxVariableString oneline
"syn region ngxString start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=ngxVariableString oneline
"syn match ngxComment '\s*#.*$'
"syn keyword ngxBoolean on
"syn keyword ngxDirectiveBlock http         contained

" highlight

hi link mtdComment Comment
hi link mtdCheck String
hi link mtdTime Identifier

"hi link ngxVariableString PreProc
"hi link ngxBlock Normal
"hi link ngxString String
"hi link ngxBoolean Boolean
"hi link ngxDirectiveBlock Statement
"hi link ngxDirectiveImportant Type
"hi link ngxDirectiveControl Keyword
"hi link ngxDirectiveError Constant
"hi link ngxDirectiveDeprecated Error
"hi link ngxDirectiveThirdParty Special

let b:current_syntax = "mintodo"
