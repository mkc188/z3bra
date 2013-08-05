" ==============================================================================
"
" Maintainer : Willy 'z3bra' Goiffon
"
" vim: fdm=marker:tw=80:cc=81:noai:et
"
" Section    :
"   > General
"   > Interface
"   > Colors & more
"   > Files
"   > Text Formatting
"   > Moving within file, buffers, windows & co.
"   > Status line
"   > Mapping
"   > Filetype commands
"   > Functions
"   > Misc
"
" ==============================================================================

"  > General ===================================================================
" {{{
"
" Use Vim default instead of 100% vi compatibility
set nocompatible

" Define <leader> key
let mapleader = "!"

" How many lines Vim use for history
set history=100

" Re-read file if changed outside
set autoread

" Automatically save before commands like :next and :make
set autowrite

filetype on
filetype indent on
" }}}

"  > Interface =================================================================
" {{{

" Show (partial) command in status line.
set showcmd

" Enable code indentation
set autoindent

" Show matching brackets.
set showmatch

" Search options
set ignorecase          " Ignore case in search
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set magic               " Use magic for regular expressions

" Disable mouse usage (all modes)
set mouse=

" Show the line number on the left (or not)
set nonumber

" Make <BACKSPACE> do what it should do
set backspace=indent,eol,start

" Improve display
set ttyfast

" Define the offset with the cursor when moving vertically
set so=7

" Turn on the WildMenu (for cmdline completion)
set wildmenu

" Files to ignore with it
set wildignore=*.o,*~

" Height of the cmdline window
set cmdheight=1

" Do not redraw while executing macros
set lazyredraw

" Suffixes that vim should ignore
set suffixes=.jpg,.png,.gif,.bak,~,.swpi,.swo,.o.info,.g,.dvi,.bbl,
            \.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo

" Disable annoying error events
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" }}}

"  > Colors & more =============================================================
" {{{

" Enable syntax
syntax on

" Use 256 colors
set t_Co=256

" Theme & colors
colorscheme sandstorm

" Improve color for dark bkgd (set by the theme)
" set background=light

" Improve display
set ttyfast

" Use unix as standard filetype
set ffs=unix,dos,mac

" Use UTF-8 for file/term encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-8859-1,default
set termencoding=utf-8

" If a tag file is present
let FILETAG=expand("tags")
if filereadable(FILETAG)
    exe 'set tags=' . FILETAG
endif
" }}}

"  > Files =====================================================================
" {{{

" Turn of backup (don't forget to push on git !!)
set nobackup
set nowb
set noswapfile

" improve vim path
set path=.,,inc,src,/usr/include
" }}}

"  > Text formatting ===========================================================
" {{{

set expandtab       " convert tabs into space
set smarttab        " Be smart !

set modeline        " Enable EOF file options

set tabstop=8       " tab = 8 spaces
set shiftwidth=4    " indentation is 4 spaces
set softtabstop=4   " Do your best, but I want 4 spaces

set lbr             " enable line break
set sbr=\\          " line break indicator
set tw=0            " text width

set ai              " auto indent
set si              " smart indent
set wrap            " wrap lines

" 2 Column to view fold
setlocal foldcolumn=0

" Underline the cursor row in the current window
au VimEnter,WinEnter,BufWinEnter * set cursorline nocursorcolumn
au WinLeave * set nocursorline nocursorcolumn

" Define how to fold files in general
set foldmethod=syntax

" Quickly switch between textwidth 0 and whatever you want
" map <leader>w :let &textwidth = &tw == 0 ? 72 : 0<CR>
map <leader>w :call ToggleTW(80)<CR>
" }}}

"  > Moving within file, buffers, windows & co. ================================
" {{{

" matchit actually comes with vim...
silent! runtime macros/matchit.vim

" Treat broken lines as multiple lines with j/k
map j gj
map k gk

" Center the cursor on the search word when using 'n'
nmap n nzz
nmap N Nzz

" Smart moving between windows r
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Managing tabs
map <leader>tn :tabnew
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove

" Open a tab with the current buffer in it
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Remember info about open buffers on close
set viminfo^=%
" }}}

"  > Status line ===============================================================
" {{{

" disable statusline
set laststatus=0
set statusline=%f\ (%n)

" use ruler instead (less intrusive
set ruler

" put everything I need in the ruler
set rulerformat=%-50(%=%M%H%R\ %f%<\ (%n)%4(%)%Y:%{&tw}%9(%l,%c%V%)%4(%)%P%)

set list
set listchars=tab:\|\ ,trail:⋅,nbsp:˽
" }}}

"  > Mapping ===================================================================
" {{{

" So that Y behave like C and D
nmap Y y$

" Keep selection when using indentation
vmap <Tab> >gv
vmap <S-Tab> <gv
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

" toggle paste mode
set pastetoggle=<F11>

" easily change the working directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" open the file correcponding to the source/header actually openned.
" it replace .c with .h in the file name, eg. file.cpp -> file.hpp
" You must set your path correctly so that :find will find it.
nnoremap <leader>ss :find %:t:s,.c,.foo,:s,.h,.c,:s,.foo,.h,<CR>

" increment numbers in a column
vnoremap <C-a> :call Incr()<CR>

" quick write (like somewhere within ZZ and ZQ...)
nnoremap ZW :w<CR>

" toggle between gcc and make
nmap <Leader>cc :call ToggleCCompiler()<CR>

" upload to sprunge.us
command! Sprunge w !curl -F 'sprunge=<-' http://sprunge.us
" }}}

"  > Filetypes commands ========================================================
" {{{

" Default FileType

" Special commands
au BufEnter             *.php set ft=php.html
au BufRead,BufNewFile   *.c,*.h set filetype=c
au BufRead,BufNewFile   *.html,*.htm ab </ </<C-x><C-o>
au BufRead              /tmp/mutt-* call ToggleTW(80)
au BufWritePost         .Xresources !xrdb %
au BufRead,BufNewFile   *.tab setfiletype chords
au BufEnter             *baseq3/*.cfg,wolfcam-ql/*.cfg let quake_is_quake3=1


" Filetype completion
set omnifunc=syntaxcomplete#Complete

autocmd FileType c          set omnifunc=ccomplete#Complete
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
" }}}

"  > Functions =================================================================
" {{{

" Change textwidth
fu! ToggleTW(num)
   if (&textwidth != a:num)
       let &textwidth = a:num
       let &colorcolumn = a:num+1
       setlocal wrap linebreak nolist
       echo "Text Width: ".a:num
   else
       let &textwidth = 0
       let &colorcolumn = 0
       setlocal nowrap
       echo "Text Width: none"
   endif
endfu

" Increment a column of number
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfu

" Display a tips
fu! ViewTips()
    " Note that this require the 'fortune' program to be installed on
    " your system, as well as the 'vimtweets' fortune file.
    "   $ wget http://bfontaine.net/fortunes/vimtweets
    "   $ strfile vimtweets vimtweets.dat
    "   # mv vimtweets* /usr/share/fortune/
    echomsg system('/usr/bin/fortune vimtweets')
endfu

" Insert <Tab> or i_CTRL_N depending on the context
fu! CleverTab()
    if strpart(getline('.'), col('.')-2, 1)  =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfu
inoremap <Tab> <C-R>=CleverTab()<CR>

" Toggle between make and gcc for compiling with :make
fu! ToggleCCompiler()
    if &makeprg =~ '^make*$'
        set makeprg=gcc\ -o\ %<.out\ %\ -Wall
    else
        set makeprg=make
    endif
endfu
" }}}

"  > Misc ======================================================================
" {{{

" Echo a vim tips on Vim startup
autocmd VimEnter *  call ViewTips()
