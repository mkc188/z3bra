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
let g:colors_name="sandstorm"

"
" Highlighting definitions.
"

    "
    " Actual colours and styles.
    "
    highlight Comment      term=NONE cterm=bold ctermfg=0    ctermbg=NONE
    highlight Constant     term=NONE cterm=bold ctermfg=3    ctermbg=NONE
    highlight Cursor       term=NONE cterm=bold ctermfg=3    ctermbg=0
    highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE    ctermbg=NONE
    highlight DiffAdd      term=NONE cterm=bold ctermfg=NONE ctermbg=2
    highlight DiffChange   term=NONE cterm=bold ctermfg=NONE ctermbg=4
    highlight DiffDelete   term=NONE cterm=bold ctermfg=NONE ctermbg=1
    highlight Folded       term=NONE cterm=bold ctermfg=0    ctermbg=0
    highlight Function     term=NONE cterm=bold ctermfg=7    ctermbg=NONE
    highlight Identifier   term=NONE cterm=bold ctermfg=3    ctermbg=NONE
    highlight IncSearch    term=NONE cterm=NONE ctermfg=0    ctermbg=3
    highlight NonText      term=NONE cterm=bold ctermfg=0    ctermbg=NONE
    highlight Normal       term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
    highlight Pmenu        term=NONE cterm=NONE ctermfg=0    ctermbg=7
    highlight PreProc      term=NONE cterm=NONE ctermfg=1    ctermbg=0
    highlight Search       term=NONE cterm=bold ctermfg=0    ctermbg=3
    highlight Special      term=NONE cterm=NONE ctermfg=1    ctermbg=NONE
    highlight SpecialKey   term=NONE cterm=bold ctermfg=1    ctermbg=NONE
    highlight Statement    term=NONE cterm=bold ctermfg=3    ctermbg=NONE
    highlight StatusLine   term=NONE cterm=NONE ctermfg=7    ctermbg=237
    highlight StatusLineNC term=NONE cterm=NONE ctermfg=0    ctermbg=237
    highlight String       term=NONE cterm=bold ctermfg=1    ctermbg=NONE
    highlight Todo         term=NONE cterm=NONE ctermfg=3    ctermbg=7
    highlight Type         term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
    highlight VertSplit    term=NONE cterm=bold ctermfg=0    ctermbg=0
    highlight Visual       term=NONE cterm=bold ctermfg=7    ctermbg=3

    "
    " General highlighting group links.
    "
    highlight! link Title           Normal
    highlight! link LineNr          NonText
    highlight! link TabLine         StatusLineNC
    highlight! link TabLineFill     StatusLineNC
    highlight! link TabLineSel      StatusLine
    highlight! link VimHiGroup      VimGroup
