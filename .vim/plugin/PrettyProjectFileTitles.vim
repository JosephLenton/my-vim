
"------------------------------------------------------------------------------
" 
" # Change title to a more pretty variant
"
" Examples:
"   
"   ~\.vimrc                            => ~     .vimrc
"   ~\.vim\syntax\css.vim               => ~\.vim\syntax     .css.vim
"   ~\projects\platform.js\src\bb.jsx   => platform.js\src    bb.jsx
"
" It's to make the name of the projects folder more clear, and the name of the
" file more clear as well.
"
"------------------------------------------------------------------------------

set title

autocmd BufEnter * call PrettyProjectFileTitles#refreshTitle()
autocmd CursorMoved,CursorMovedI,BufWritePost * call PrettyProjectFileTitles#refreshModified()

let b:newTitle = ""
let b:titleModified = ""

function PrettyProjectFileTitles#updateTitle()
    let b:newTitle = ""

    if ( expand("%:p:h") == $HOME )
        let b:newTitle = "~"
    else
        let l:oldCD = getcwd()

        if ( isdirectory($HOME . "/projects/") )
            cd ~/projects/
            let b:newTitle = expand("%:h")
            cd `=l:oldCD`
        endif

        if (                                                                
\               ( isdirectory($HOME . "/projects/") == 0 ) ||               
\               ( matchstr(b:newTitle, "^\\") == "\\"    ) ||               
\               ( matchstr(b:newTitle, "^/" ) == "/"     )                  
\       )
            cd ~
            let b:newTitle = expand("%:h")
            cd `=l:oldCD`

            if ( has("win32") || has("win64") )
                if ( matchstr(b:newTitle, "^\\") == "" )
                    let b:newTitle = "~\\" . b:newTitle
                endif
            else
                if ( matchstr(b:newTitle, "^/" ) == "" )
                    let b:newTitle = "~\\" . b:newTitle
                endif
            endif
        endif
    endif
endfunction

function PrettyProjectFileTitles#updateModified()
    if ( &modified )
        let b:titleModified = "*"
    else
        let b:titleModified = " "
    endif
endfunction

function PrettyProjectFileTitles#refreshTitle()
    call PrettyProjectFileTitles#updateTitle()
    call PrettyProjectFileTitles#updateModified()
    call PrettyProjectFileTitles#showChanges()
endfunction

function PrettyProjectFileTitles#refreshModified()
    call PrettyProjectFileTitles#updateModified()
    call PrettyProjectFileTitles#showChanges()
endfunction

function PrettyProjectFileTitles#showChanges()
    let &titlestring = b:newTitle . "        " . expand("%:t") . b:titleModified
endfunction


