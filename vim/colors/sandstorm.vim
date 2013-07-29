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
if has("gui_running") || &t_Co == 256

    "
    " Actual colours and styles.
    "
    highlight Comment      term=NONE cterm=NONE ctermfg=0    ctermbg=NONE
    highlight Constant     term=NONE cterm=NONE ctermfg=226  ctermbg=NONE
    highlight Cursor       term=NONE cterm=NONE ctermfg=66   ctermbg=222
    highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=233
    highlight DiffAdd      term=NONE cterm=NONE ctermfg=NONE ctermbg=22
    highlight DiffChange   term=NONE cterm=NONE ctermfg=NONE ctermbg=17
    highlight DiffDelete   term=NONE cterm=NONE ctermfg=NONE ctermbg=52
    highlight DiffText     term=NONE cterm=NONE ctermfg=NONE ctermbg=19
    highlight FoldColumn   term=NONE cterm=NONE ctermfg=180  ctermbg=237
    highlight Folded       term=NONE cterm=NONE ctermfg=250  ctermbg=237

    highlight Function     term=NONE cterm=NONE ctermfg=136  ctermbg=NONE
    highlight Identifier   term=NONE cterm=NONE ctermfg=220  ctermbg=NONE
    highlight Ignore       term=NONE cterm=NONE ctermfg=240  ctermbg=NONE
    highlight IncSearch    term=NONE cterm=NONE ctermfg=11   ctermbg=3
    highlight ModeMsg      term=NONE cterm=NONE ctermfg=178  ctermbg=NONE
    highlight MoreMsg      term=NONE cterm=NONE ctermfg=240  ctermbg=NONE
    highlight NonText      term=NONE cterm=NONE ctermfg=237  ctermbg=NONE
    highlight Normal       term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
    highlight Pmenu        term=NONE cterm=NONE ctermfg=231  ctermbg=237
    highlight PreProc      term=NONE cterm=NONE ctermfg=178  ctermbg=NONE
    highlight Question     term=NONE cterm=NONE ctermfg=186  ctermbg=NONE
    highlight Search       term=NONE cterm=NONE ctermfg=0    ctermbg=11
    highlight Special      term=NONE cterm=NONE ctermfg=222  ctermbg=NONE
    highlight SpecialKey   term=NONE cterm=NONE ctermfg=184  ctermbg=NONE
    highlight Statement    term=NONE cterm=NONE ctermfg=11   ctermbg=NONE
    highlight StatusLine   term=NONE cterm=NONE ctermfg=231  ctermbg=237
    highlight StatusLineNC term=NONE cterm=NONE ctermfg=16   ctermbg=237
    highlight String       term=NONE cterm=NONE ctermfg=166  ctermbg=NONE
    highlight Todo         term=NONE cterm=NONE ctermfg=196  ctermbg=226
    highlight Type         term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
    highlight Underlined   term=NONE cterm=NONE ctermfg=186  ctermbg=NONE
    highlight VertSplit    term=NONE cterm=NONE ctermfg=243  ctermbg=237
    highlight Visual       term=NONE cterm=NONE ctermfg=11   ctermbg=237
    highlight WarningMsg   term=NONE cterm=NONE ctermfg=209  ctermbg=NONE

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

endif

