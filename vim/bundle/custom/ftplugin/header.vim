fu! AddFileHeader()
    let s:line=1
    call append(0,  "\/*")
    call append(s:line,  " * ===== SOURCE FILE ==========================================")
    call append(s:line+1, " *")
    call append(s:line+2, " *          Filename:  " .expand("%"))
    call append(s:line+3, " *            Author:  Willy Goiffon")
    call append(s:line+4, " *")
    call append(s:line+5, " *     Creation Date:  " .strftime("%d-%m-%Y %H:%M:%S"))
    call append(s:line+6, " *     Last Modified:  ")
    call append(s:line+7, " *          Compiler:  " .$CC)
    call append(s:line+8, " *")
    call append(s:line+9, " *       Description:  ")
    call append(s:line+10, " *")
    call append(s:line+11," * ============================================================")
    call append(s:line+12, " */")
    call append(s:line+13, "")
    unlet s:line
endfunc

fu! UpdateFileHeader()
    normal ma
    exe "8g/Last Modified/s/Last Modified:.*/Last Modified:  " .strftime("%c")
    normal `a
endfunc

au BufNewFile *.c  exe "call AddFileHeader()"
au BufWritePre *.c exe "call UpdateFileHeader()"
