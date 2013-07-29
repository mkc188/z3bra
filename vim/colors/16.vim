"
" Terminal setup.
"
set background=dark
if version > 580
    highlight clear
    if exists("g:syntax_on")
        syntax reset
    endif
endif
let g:colors_name="16"

    "
    " Actual colours and styles.
    "
    highlight Comment      term=NONE cterm=NONE ctermfg=0    ctermbg=NONE
    highlight Constant     term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
    highlight Cursor       term=NONE cterm=NONE ctermfg=66   ctermbg=222
    highlight CursorLine   term=NONE cterm=NONE ctermfg=15   ctermbg=8
    highlight DiffAdd      term=NONE cterm=NONE ctermfg=NONE ctermbg=2
    highlight DiffChange   term=NONE cterm=NONE ctermfg=NONE ctermbg=4
    highlight DiffDelete   term=NONE cterm=NONE ctermfg=NONE ctermbg=1
    highlight DiffText     term=NONE cterm=NONE ctermfg=NONE ctermbg=4
    highlight FoldColumn   term=NONE cterm=NONE ctermfg=5    ctermbg=8
    highlight Folded       term=NONE cterm=NONE ctermfg=7    ctermbg=8

    highlight Function     term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
    highlight Identifier   term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
    highlight Ignore       term=NONE cterm=NONE ctermfg=8    ctermbg=NONE
    highlight IncSearch    term=NONE cterm=NONE ctermfg=11   ctermbg=3
    highlight ModeMsg      term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
    highlight MoreMsg      term=NONE cterm=NONE ctermfg=8    ctermbg=NONE
    highlight NonText      term=NONE cterm=NONE ctermfg=8    ctermbg=NONE
    highlight Normal       term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
    highlight Pmenu        term=NONE cterm=NONE ctermfg=15   ctermbg=8
    highlight PreProc      term=NONE cterm=NONE ctermfg=9    ctermbg=NONE
    highlight Question     term=NONE cterm=NONE ctermfg=6    ctermbg=NONE
    highlight Search       term=NONE cterm=NONE ctermfg=0    ctermbg=11
    highlight Special      term=NONE cterm=NONE ctermfg=9    ctermbg=NONE
    highlight SpecialKey   term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
    highlight Statement    term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
    highlight StatusLine   term=NONE cterm=NONE ctermfg=15   ctermbg=0
    highlight StatusLineNC term=NONE cterm=NONE ctermfg=0    ctermbg=8
    highlight String       term=NONE cterm=NONE ctermfg=9    ctermbg=NONE
    highlight Todo         term=NONE cterm=NONE ctermfg=1    ctermbg=11
    highlight Type         term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
    highlight Underlined   term=NONE cterm=NONE ctermfg=2    ctermbg=NONE
    highlight VertSplit    term=NONE cterm=NONE ctermfg=0    ctermbg=8
    highlight Visual       term=NONE cterm=NONE ctermfg=11   ctermbg=8
    highlight WarningMsg   term=NONE cterm=NONE ctermfg=1  ctermbg=NONE

    "
    " General highlighting group links.
    "
    highlight! link Title       Normal
    highlight! link LineNr      NonText
    highlight! link TabLine     StatusLineNC
    highlight! link TabLineFill StatusLineNC
    highlight! link TabLineSel  StatusLine
    highlight! link VertSplit   StatusLineNC
    highlight! link VimHiGroup  VimGroup
