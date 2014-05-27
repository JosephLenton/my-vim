
set-alias ss select-string 

$global:__lastFile = $null

function ssearch ([string]$text) {
    $files = select-string $text *.c, *.h, *.cpp, *.php, *.java, *.cs, *.js, *.jsx, *.json, *.ts, *.txt, *.md, *.html, *.htm, *.hta, *.xhtml, *.xhtm, *.vbs, *.vb, *.css, *.less, *.sass, *.xml, *.yaml, *.rb, *.qb, *.pl, *.pro, *.tcl, *.awk, *.sh, *.vim, *.vimrc

    if ( $files.length -gt 0 ) {
        $global:__lastFile = $files[0]
    } else {
        $global:__lastFile = $null
    }

    return $files
}

function s ([string]$text) {
    if ( $text -ne "" ) {
        return ssearch( $text )
    } elseif ( $global:__lastFile -ne $null ) {
        vim $global:__lastFile.path
    }
}

function sg ([string]$text) {
    if ( $text -ne "" ) {
        return s( $text )
    } elseif ( $global:__lastFile -ne $null ) {
        gvim $global:__lastFile.path
    }
}

##
## Author   : Roman Kuzmin
## Synopsis : Resize console window/buffer using arrow keys
## See      : http://stackoverflow.com/questions/153983/are-there-any-better-command-prompts-for-windows
##

function Size($w, $h) {
    New-Object System.Management.Automation.Host.Size( $w, $h )
}

function resize() {
    Write-Host '[Arrows] resize  [Esc] exit ...'
    $ErrorActionPreference = 'SilentlyContinue'

    for( $ui = $Host.UI.RawUI; ; ) {
        $b = $ui.BufferSize
        $w = $ui.WindowSize

        switch ( $ui.ReadKey(6).VirtualKeyCode ) {
            37 {
                $w = Size ($w.width - 1) $w.height
                $ui.WindowSize = $w
                $ui.BufferSize = Size $w.width $b.height
                break
            }
            39 {
                $w = Size ($w.width + 1) $w.height
                $ui.BufferSize = Size $w.width $b.height
                $ui.WindowSize = $w
                break
            }
            38 {
                $ui.WindowSize = Size $w.width ($w.height - 1)
                break
            }
            40 {
                $w = Size $w.width ($w.height + 1)
                if ($w.height -gt $b.height) {
                    $ui.BufferSize = Size $b.width $w.height
                }
                $ui.WindowSize = $w
                break
            }
            27 {
                return
            }
        }
    }
}
