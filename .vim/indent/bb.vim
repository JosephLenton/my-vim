" Vim indent file
" Language: Blitz2D (ft=bb), Blitz3D (ft=bb)
" Author: Stefan Schindler <stefan@boxbox.org>
" Last Change: Sun, 25 Mar 2007 23:13:33 CEST

if exists( "b:did_indent" )
	finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=BbGetIndent(v:lnum)
setlocal indentkeys&
setlocal indentkeys+==~endif,=~else,=~elseif,=~next,=~wend,=~until,=~forever,~=case,~=end\ select
setlocal indentkeys+==~default,=~include,=~end\ type,=~end\ function,0.

let b:undo_indent = "set ai< indentexpr< indentkeys<"

fun! BbGetIndent( lnum )
	let this_line = getline( a:lnum )
	let LABEL_OR_PREPROC = '^\s*\(\..*$\|\<include\>.*$\)'

	if this_line =~? LABEL_OR_PREPROC
		return 0
	endif
	
	let lnum = a:lnum
	while lnum > 0
		let lnum = prevnonblank( lnum - 1 )
		let prev_line = getline( lnum )

		if prev_line !~? LABEL_OR_PREPROC
			break
		endif
	endwhile

	if lnum == 0
		return 0
	endif

	let ind = indent( lnum )

	if prev_line =~? '^\s*\<\(if\|elseif\)\>.\{-}then\s*$'
		let ind = ind + &sw
	elseif prev_line =~? '^\s*\<\(for\|while\|repeat\|case\|default\|else\|type\|function\)\>'
		let ind = ind + &sw
	elseif prev_line =~? '^\s*\<select\>'
		let ind = ind + &sw * 2
	endif

	if this_line =~? '^\s*\<\(endif\|else\|elseif\|next\|wend\|until\|forever\|case\|default\|end\stype\|end\sfunction\)\>'
		let ind = ind - &sw
	elseif this_line =~? '^\s*\<end\sselect\>'
		let ind = ind - &sw * 2
	endif

	return ind
endfun
