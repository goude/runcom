" experimental, based on https://github.com/daviesjamie/vim-base16-lightline/blob/master/autoload/lightline/colorscheme/base16.vim

" this is an ugly hack relying on the g:terminal_colors being set
" in the base16-*-.vim scripts.

let s:base00 = [ g:terminal_color_0,  0 ] " black
let s:base01 = [ g:terminal_color_10, 18 ]
let s:base02 = [ g:terminal_color_11, 19 ]
let s:base03 = [ g:terminal_color_8,  8 ]
let s:base04 = [ g:terminal_color_12, 20 ]
let s:base05 = [ g:terminal_color_7,  7 ]
let s:base06 = [ g:terminal_color_13, 21 ]
let s:base07 = [ g:terminal_color_15, 15 ] " white

let s:base08 = [ g:terminal_color_1,  1 ] " red
let s:base09 = [ g:terminal_color_9, 16 ] " orange
let s:base0A = [ g:terminal_color_3,  3 ] " yellow
let s:base0B = [ g:terminal_color_2,  2 ] " green
let s:base0C = [ g:terminal_color_6,  6 ] " teal
let s:base0D = [ g:terminal_color_4,  4 ] " blue
let s:base0E = [ g:terminal_color_5,  5 ] " pink
let s:base0F = [ g:terminal_color_14, 17 ] " brown

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:base01, s:base03 ], [ s:base05, s:base02 ] ]
let s:p.insert.left     = [ [ s:base00, s:base0D ], [ s:base05, s:base02 ] ]
let s:p.visual.left     = [ [ s:base00, s:base09 ], [ s:base05, s:base02 ] ]
let s:p.replace.left    = [ [ s:base00, s:base08 ], [ s:base05, s:base02 ] ]
let s:p.inactive.left   = [ [ s:base02, s:base00 ] ]

let s:p.normal.middle   = [ [ s:base07, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base01, s:base00 ] ]

let s:p.normal.right    = [ [ s:base01, s:base03 ], [ s:base03, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base01, s:base00 ] ]

let s:p.normal.error    = [ [ s:base07, s:base08 ] ]
let s:p.normal.warning  = [ [ s:base07, s:base09 ] ]

let s:p.tabline.left    = [ [ s:base05, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base05, s:base01 ] ]
let s:p.tabline.right   = [ [ s:base05, s:base02 ] ]
let s:p.tabline.tabsel  = [ [ s:base02, s:base0A ] ]

let g:lightline#colorscheme#base16#palette = lightline#colorscheme#flatten(s:p)
