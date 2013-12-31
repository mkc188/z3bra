" ==============================================================================
"
" Maintainer : z3bra
"
" vim: fdm=marker:
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

" Re-read file if changed outside
set autoread

" Automatically save before commands like :next and :make
set autowrite

filetype on
filetype indent on
" }}}

"  > Interface =================================================================
" {{{

" Show matching brackets.
"set showmatch

" Search options
set ignorecase          " Ignore case in search
set smartcase           " Do smart case matching

" Make <BACKSPACE> do what it should do
set backspace=2

" Define the offset with the cursor when moving vertically
set so=7

" Turn on the WildMenu (for cmdline completion)
set wildmenu
set wildignore=*.o,*~

" Suffixes that vim should ignore
set suffixes=.jpg,.png,.gif,.bak,~,.swpi,.swo,.o.info,.g,.dvi,.bbl,
            \.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo

" Disable visual bell
set t_vb=
" }}}

"  > Colors & more =============================================================
" {{{

" Enable syntax
syntax on

" Theme & colors
colorscheme shblah

" Use UTF-8 for file/term encoding
set encoding=utf-8
set fileencodings=utf-8,iso-8859-1,latin1,default
call matchadd('ColorColumn', '\%81v', 100) " show column 80 ONLY when necessary
" }}}

"  > Files =====================================================================
" {{{

" Turn of backup (don't forget to push on git !!)
set nowb

" generate with ctags -R -f ~/.vim/systags /usr/include /usr/local/include
set tags+=~/.vim/systags

" improve vim path
set path=.,,inc,src,/usr/include,/usr/local/include
" }}}

"  > Text formatting ===========================================================
" {{{

set expandtab       " convert tabs into space
set tabstop=8       " tab = 8 spaces
set shiftwidth=4    " indentation is 4 spaces
set softtabstop=4   " Do your best, but I want 4 spaces

set lbr             " enable line break
set sbr=\\          " line break indicator
set tw=0            " text width

set si              " smart indent (also toggle autoident on)

" Open vsplits on the right
set splitright

" Define how to fold files in general
set foldmethod=syntax

" Quickly switch between textwidth 0 and whatever you want
map <leader>w :let &textwidth = &tw == 0 ? 80 : 0<CR>:set tw<CR>
" }}}

"  > Moving within file, buffers, windows & co. ================================
" {{{

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

" Open a tab with the current buffer in it
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" }}}

"  > Status line ===============================================================
" {{{

" disable statusline
set laststatus=0
set statusline=

" use ruler instead (less intrusive)
set ruler

" put everything I need in the ruler
set rulerformat=%-28(%=%M%H%R\ %t%<\ %l,%c%V%8(%)%P%)

set list lcs=tab:│\ ,trail:⋅,nbsp:~
set fillchars=vert:│,fold:-
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

" easily change the working directory to the one of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" open the file correcponding to the source/header actually openned.
" it replace .c with .h in the file name, eg. file.cpp -> file.hpp
" You must set your path correctly so that :find will find it.
nnoremap <leader>ss :find %:t:s,.c,.foo,:s,.h,.c,:s,.foo,.h,<CR>

" increment numbers in a column
vnoremap <C-a> :call Incr()<CR>

" toggle between tcc and make
nmap <Leader>cc :call ToggleCCompiler(tcc)<CR>

" upload to sprunge.us (without range, upload the whole file)
command! -range=% Sprunge <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us
" }}}

"  > Filetypes commands ========================================================
" {{{

" Special commands
au FileType             make set noet
au Filetype             php set ft=php.html
au Filetype             html ab </ </<C-x><C-o>
au Filetype             mail set tw=80 fdm=marker
au BufWritePost         .Xresources !xrdb %


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

" Increment a column of number
fu! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfu

" Display a tips
"fu! ViewTips()
"    " Note that this require the 'fortune' program to be installed on
"    " your system, as well as the 'vimtweets' fortune file.
"    "   $ wget http://bfontaine.net/fortunes/vimtweets
"    "   $ strfile vimtweets vimtweets.dat
"    "   # mv vimtweets* /usr/share/fortune/
"    if filereadable('/usr/bin/fortune')
"        if filereadable('/usr/share/fortune/vimtweets')
"            echomsg system('/usr/bin/fortune vimtweets')
"        endif
"    endif
"endfu

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
fu! ToggleCCompiler(cc)
    if &makeprg =~ '^make*$'
        set makeprg=a:cc\ -o\ %<.out\ %\ -Wall
    else
        set makeprg=make
    endif

    set makeprg
endfu
" }}}

"  > Misc ======================================================================
" {{{

" Echo a vim tips on Vim startup
"autocmd VimEnter *  call ViewTips()
