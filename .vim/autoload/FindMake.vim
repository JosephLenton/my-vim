
function FindMake#run()
    let l:folder = ProjectRootGuess()
    let l:makeFile = FindMake#searchForMakeFile( l:folder )
    
    if l:makeFile != ""
        execute 'Dispatch make -s --directory "' . l:folder . '" -f "' . l:makeFile . '"'
    endif
endfunction

function FindMake#runOnSave(ext)
    autocmd BufWritePost ext call FindMake#run()
endfunction

function FindMake#searchForMakeFile(folder)
    let l:windows = has("win32") || has("win64")

    let l:makeFile = findfile( "makefile", a:folder )
    if l:makeFile != ""
        return l:makeFile
    else
        if has("win32") || has("win64")
            let l:makeFile = findfile( "Makefile", a:folder )

            if l:makeFile != ""
                return l:makeFile
            endif
        endif
    endif

    return ""
endfunction

