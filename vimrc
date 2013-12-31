"
" ╻ ╻╻┏┳┓┏━┓┏━╸   ┏━╸╻╻  ┏━╸
" ┃┏┛┃┃┃┃┣┳┛┃     ┣╸ ┃┃  ┣╸
" ┗┛ ╹╹ ╹╹┗╸┗━╸   ╹  ╹┗━╸┗━╸
"                       -- by z3bra

" GENERAL {{{
let mapleader = "!" " Define <leader> key

set autoread " Re-read file if changed outside
set autowrite " Automatically save before commands like :next and :make

filetype on
filetype indent on
" }}}
" BEHAVIOR {{{
set ignorecase          " Ignore case in search
set smartcase           " Do smart case matching

set backspace=2 " Make <BACKSPACE> do what it should do

set so=7 " Define the offset with the cursor when moving vertically
set t_vb= " Disable visual bell

set wildmenu " Turn on the WildMenu (for cmdline completion)
set wildignore=*.o,*~

" Suffixes that vim should ignore
set suffixes=.jpg,.png,.gif,.bak,~,.swpi,.swo,.o.info,.g,.dvi,.bbl,
            \.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo

set nowb " Turn off backup
set tags+=~/.vim/systags " used for omnicompletion
set path=.,,inc,src,/usr/include,/usr/local/include " improve vim path
" }}}
" DISPLAY {{{
syntax on " Enable syntax
colorscheme shblah " Theme & colors

set encoding=utf-8 " Use UTF-8 for file/term encoding
set fileencodings=utf-8,iso-8859-1,latin1,default

call matchadd('ColorColumn', '\%81v', 100) " show column 80 ONLY when necessary

set laststatus=0 " disable statusline

" use ruler instead (less intrusive)
set ruler rulerformat=%-28(%=%M%H%R\ %t%<\ %l,%c%V%8(%)%P%)

set list lcs=tab:│\ ,trail:⋅,nbsp:~
set fillchars=vert:│,fold:-
" }}}
" FORMATTING {{{
set si              " smart indent (also toggle autoident on)
set expandtab       " convert tabs into space
set tabstop=8       " tab = 8 spaces
set shiftwidth=4    " indentation is 4 spaces
set softtabstop=4   " Do your best, but I want 4 spaces

set lbr             " enable line break
set sbr=\\          " line break indicator

set splitright " Open vsplits on the right
set foldmethod=syntax " Define how to fold files in general

" Quickly switch between textwidth 0 and 80
map <leader>w :let &textwidth = &tw == 0 ? 80 : 0<CR>:set tw<CR>
" }}}
" MAPPING {{{
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

" So that Y behave like C and D
nmap Y y$

" Keep selection when using indentation
vmap <Tab> >gv
vmap <S-Tab> <gv
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

set pastetoggle=<F11> " toggle paste mode

" easily change the working directory to the one of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" open the file correcponding to the source/header actually openned.
" it replace .c with .h in the file name, eg. file.cpp -> file.hpp
" You must set your path correctly so that :find will find it.
nnoremap <leader>ss :find %:t:s,.c,.foo,:s,.h,.c,:s,.foo,.h,<CR>

vnoremap <C-a> :call Incr()<CR>
inoremap <Tab> <C-R>=CleverTab()<CR>
nmap <Leader>cc :call ToggleCCompiler(tcc)<CR>

" upload to sprunge.us (without range, upload the whole file)
command! -range=% Sprunge <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us
" }}}
" AUTOCOMMANDS {{{
au FileType             make set noet
au Filetype             php set ft=php.html
au Filetype             html ab </ </<C-x><C-o>
au Filetype             mail set tw=80 fdm=marker
au BufWritePost         .Xresources !xrdb %


set omnifunc=syntaxcomplete#Complete
au FileType c          set omnifunc=ccomplete#Complete
au FileType html       set omnifunc=htmlcomplete#CompleteTags
au FileType css        set omnifunc=csscomplete#CompleteCSS
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType php        set omnifunc=phpcomplete#CompletePHP
" }}}
" FUNCTIONS {{{
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
fu! ViewTips()
    " Note that this require the 'fortune' program to be installed on
    " your system, as well as the 'vimtweets' fortune file.
    "   $ wget http://bfontaine.net/fortunes/vimtweets
    "   $ strfile vimtweets vimtweets.dat
    "   # mv vimtweets* /usr/share/fortune/
    if filereadable('/usr/bin/fortune')
        if filereadable('/usr/share/fortune/vimtweets')
            echomsg system('/usr/bin/fortune vimtweets')
        endif
    endif
endfu
autocmd VimEnter *  call ViewTips()

" Insert <Tab> or i_CTRL_N depending on the context
fu! CleverTab()
    if strpart(getline('.'), col('.')-2, 1)  =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfu

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
"
" vim: fdm=marker
