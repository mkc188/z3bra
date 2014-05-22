"
" ╻ ╻╻┏┳┓┏━┓┏━╸   ┏━╸╻╻  ┏━╸
" ┃┏┛┃┃┃┃┣┳┛┃     ┣╸ ┃┃  ┣╸
" ┗┛ ╹╹ ╹╹┗╸┗━╸   ╹  ╹┗━╸┗━╸
"                       -- by z3bra

" GENERAL {{{
let mapleader = "!" " Define <leader> key

set mouse= " noppest nope I've ever noped

set autoread " Re-read file if changed outside
set autowrite " Automatically save before commands like :next and :make

filetype indent on " enable indentation per language
" }}}
" BEHAVIOR {{{
set scrolloff=7 " Define the offset with the cursor when moving vertically
set backspace=2 " Make <BACKSPACE> do what it should do

" create a backup of existing files, delete afterwards
set noswapfile
set nowritebackup
set nobackup
set undofile
set undodir=$HOME/.vim/undo

set virtualedit=block " make visual blocks easier to understand

set tags+=~/.vim/systags " used for omnicompletion
set path=.,,inc,src,/usr/include,/usr/local/include " improve vim path
" }}}
" DISPLAY {{{
syntax on " Enable syntax
colorscheme shblah " Theme & colors

set encoding=utf-8  " Use UTF-8 for file/term encoding
set wildmenu        " Use the wildmenu

call matchadd('ColorColumn', '\%81v', 100) " show column 80 ONLY when necessary

set statusline=─
set laststatus=0 noruler " rulerformat=%-28(%=%M%H%R\ %t%<\ %l,%c%V%8(%)%P%)

set list lcs=tab:│\ ,trail:⋅,nbsp:~
set fillchars=vert:│,fold:-,stl:─,stlnc:┈
" }}}
" FORMATTING {{{
set smartindent         " smart indent (also toggle autoident on)
set expandtab           " convert tabs into space
set shiftwidth=4        " indentation is 4 spaces
set softtabstop=4       " Do your best, but I want 4 spaces

set lbr                 " enable line break
set sbr=>               " line break indicator

set splitright          " Open vsplits on the right
set foldmethod=syntax   " Define how to fold files in general
" }}}
" MAPPING {{{
" Treat broken lines as multiple lines with j/k
map j gj
map k gk

" Center the cursor on the search word when using 'n'
nmap n nzz
nmap N Nzz

nmap <Space> :nohl<CR>

" Keep selection when using indentation
vnoremap > >gv
vnoremap < <gv

vnoremap <C-a> :call Incr()<CR>
inoremap <Tab> <C-R>=CleverTab()<CR>

nnoremap <leader>d :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>h :find %:t:s,.c,.ga,:s,.h,.c,:s,.ga,.h,<CR>
map      <leader>w :let &textwidth = &tw == 0 ? 80 : 0<CR>:set tw<CR>
nmap     <leader>c :call ToggleCCompiler()<CR>
nmap     <leader>d mz:exe append(line("."), strftime("%d %B, %Y"))<CR>'zJ
nmap     <leader>l :echomsg line('.')<CR>
nmap     <leader>s :echomsg line('$')<CR>
nmap     <leader>f :echomsg expand('%:p')<CR>

" Underline the current line with either a specific char
nmap     <leader>= yyp:s/./=/g<CR>
nmap     <leader>- yyp:s/./-/g<CR>

" upload to sprunge.us (without range, upload the whole file)
command! -range=% Sprunge <line1>,<line2>w !curl -F 'sprunge=<-' http://sprunge.us
" }}}
" AUTOCOMMANDS {{{
au FileType             make set noet
au Filetype             html ab -- &mdash;
au Filetype             html ab </ </<C-X><C-o>
au Filetype             mail set tw=80 fdm=marker
au BufWritePost         *.sh !chmod +x %
au BufWritePost         *Xresources !xrdb %
au VimEnter             * call ViewTips()

set omnifunc=syntaxcomplete#Complete
au FileType c          set omnifunc=ccomplete#Complete
au FileType cpp        set omnifunc=ccomplete#Complete
au FileType html       set omnifunc=htmlcomplete#CompleteTags
au FileType css        set omnifunc=csscomplete#CompleteCSS
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

" Insert <Tab> or i_CTRL_N depending on the context
fu! CleverTab()
    if strpart(getline('.'), col('.')-2, 1)  =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfu

" Toggle between make and cc for compiling with :make
fu! ToggleCCompiler()
    if &makeprg =~ '^make*$'
        set makeprg=cc\ -o\ %<.out\ %\ -Wall
    else
        set makeprg=make
    endif
    set makeprg
endfu

" escape every HTML char in the line/selection
fu! EscapeHTML()
    silent! s/</\&lt;/g
    silent! s/>/\&gt;/g
    silent! s/"/\&quot;/g
endfu

" insert the TOhtml version of the selection
fu! CodeHTML(newft)
    let oldft = &ft         " remember current filetype
    let ft = a:newft        " filetype to be used
    '<,'>TOhtml             " convert the selection to HTML
    /^<pre/+1,/^<\/pre>/-1d " get the code in between <pre> tags
    bd!                     " remove the HTML temporary buffer
    norm gvp                " copy that in place of the old text
    let ft = &oldft          " recall the saved filetype
endfu

" }}}
"
" vim: fdm=marker
