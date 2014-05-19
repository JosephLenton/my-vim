
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
autocmd BufEnter * call PrettyProjectFileTitles#updateTitle()

function PrettyProjectFileTitles#updateTitle()
    let l:newTitle = ""

    if ( expand("%:p:h") == $HOME )
        let l:newTitle = "~"
    else
        let l:oldCD = getcwd()

        if ( isdirectory($HOME . "/projects/") )
            cd ~/projects/
            let l:newTitle = expand("%:h")
            cd `=l:oldCD`
        endif

        if (                                                                
\               ( isdirectory($HOME . "/projects/") == 0 ) ||               
\               ( matchstr(l:newTitle, "^\\") == "\\"    ) ||               
\               ( matchstr(l:newTitle, "^/" ) == "/"     )                  
\       )
            cd ~
            let l:newTitle = expand("%:h")
            cd `=l:oldCD`

            if ( has("win32") || has("win64") )
                if ( matchstr(l:newTitle, "^\\") == "" )
                    let l:newTitle = "~\\" . l:newTitle
                endif
            else
                if ( matchstr(l:newTitle, "^/" ) == "" )
                    let l:newTitle = "~\\" . l:newTitle
                endif
            endif
        endif
    endif

    let &titlestring = l:newTitle . "        " . expand("%:t")
endfunction


