
set-alias ss select-string 

$global:__lastFile = $null

function ssearch ([string]$text) {
    $files = select-string $text *.php, *.java, *.cs, *.js, *.jsx, *.json, *.ts, *.txt, *.md, *.html, *.htm, *.hta, *.xhtml, *.xhtm, *.vbs, *.vb, *.css, *.less, *.sass, *.xml, *.rb, *.qb, *.pl, *.pro, *.tcl, *.vim, .vimrc

    if ( $files.length -gt 0 ) {
        $global:__lastFile = $files[0]
    } else {
        $global:__lastFile = $null
    }

    echo $files
}

function s ([string]$text) {
    if ( $text -ne "" ) {
        ssearch $text
    } elseif ( $global:__lastFile -ne $null ) {
        vim $global:__lastFile.path
    }
}

function sg ([string]$text) {
    if ( $text -ne "" ) {
        s $text
    } elseif ( $global:__lastFile -ne $null ) {
        gvim $global:__lastFile.path
    }
}

