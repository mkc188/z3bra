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
    hi Cursor                   ctermfg=7 ctermbg=0 cterm=bold
    hi CursorLine               ctermfg=15 ctermbg=NONE cterm=underline
    hi Folded                   ctermfg=0 ctermbg=0 cterm=bold
    hi LineNr                   ctermfg=7
    hi NonText                  ctermfg=7
    hi Normal                   ctermfg=7
    hi StatusLine               ctermfg=7 ctermbg=0 cterm=bold
    hi Visual                   ctermfg=7 ctermbg=0

    " Main groups
    hi Comment                  ctermfg=0 cterm=bold
    hi Constant                 ctermfg=3 cterm=bold
    hi Statement                ctermfg=3 cterm=bold
    hi StatementU               ctermfg=1
    hi Keyword                  ctermfg=3
    hi Underlined               cterm=underline
    hi Error                    ctermfg=7 ctermbg=1 cterm=bold
    hi String                   ctermfg=1 cterm=bold

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
