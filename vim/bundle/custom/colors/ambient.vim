" Maintainer:	Kevin Hamer <kevin@imarc.net>
" Version:      1.2
" Last Change:  Fri Aug 12 16:53:40 EDT 2011

" Changes:
" 1.2  lightened the blue slightly
" 1.1  lightened both orange-reds 

"" Based off the colors for Ambiance, the 2011 Ubuntu dark human theme.
"" Derived from Mustang by Henrique C. Alves (hcarvalhoalves@gmail.com)
"" Offers 256 color support.

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ambient"

" Vim >= 7.0 specific colors
if version >= 700
  " hi CursorLine   cterm=underline
  hi CursorLine   cterm=underline
  hi ColorColumn  ctermfg=15 ctermbg=7 cterm=none
  hi MatchParen   ctermfg=15 ctermbg=8 cterm=bold
  hi Pmenu 		  ctermfg=15 ctermbg=8
  hi PmenuSel 	  ctermfg=8  ctermbg=15
endif
" General colors
hi Cursor 		ctermbg=12
hi Normal 		ctermfg=8
hi NonText 		ctermfg=237
hi LineNr 		ctermfg=239
hi StatusLine 	ctermfg=8 ctermbg=15
hi StatusLineNC ctermfg=246
hi VertSplit 	ctermfg=234
hi Folded 		ctermfg=80
hi Title		ctermfg=8
hi Visual		ctermfg=15
hi SpecialKey	ctermfg=239

" Syntax highlight
hi Comment 		ctermfg=6
hi Boolean      ctermfg=5
hi String 		ctermfg=13
hi Identifier 	ctermfg=13
hi Function 	ctermfg=8
hi Type 		ctermfg=10
hi Statement 	ctermfg=11
hi Keyword		ctermfg=4
hi Constant 	ctermfg=5
hi Number		ctermfg=13
hi Special		ctermfg=5
hi PreProc 		ctermfg=7
hi Todo         ctermfg=15 ctermbg=8
