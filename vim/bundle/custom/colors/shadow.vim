" Vim colorscheme
"
" Focus on statements and values

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "shadow"

" Window elements
hi Cursor                   ctermfg=0 ctermbg=15
hi Folded                   ctermfg=8 ctermbg=0
hi LineNr                   ctermfg=7
hi NonText                  ctermfg=7
hi Normal                   ctermfg=7
hi StatusLine               ctermfg=15 ctermbg=0 cterm=none
hi Visual                   ctermfg=15 ctermbg=0

" Main groups
hi Comment                  ctermfg=15
hi Constant                 ctermfg=11 cterm=none
hi Statement                ctermfg=11 cterm=none
hi StatementU               ctermfg=11 cterm=underline
hi Keyword                  ctermfg=8
hi Underlined               cterm=underline
hi Error                    ctermfg=15 ctermbg=1

hi! link String             Constant
hi! link Character          Constant
hi! link Number             Constant
hi! link Boolean            Constant
hi! link Float              Constant

hi! link Identifier         Normal
hi! link Function           Statement

hi! link Operator           Keyword
hi! link Preproc            Keyword
hi! link Type               Keyword

hi! link Special            Keyword
hi! link Ignore             Normal
hi! link Todo               Error

hi! link Title              Normal 

hi! link phpDefine          StatementU

hi! link HtmlArg            Attribute
hi! link HtmlSpecialChar    Statement

hi! link xmlTagName         Keyword
hi! link xmlEndTag          Keyword
hi! link xmlEntity          Statement
hi! link xmlCData           Comment
hi! link xmlAttrib          Attribute
