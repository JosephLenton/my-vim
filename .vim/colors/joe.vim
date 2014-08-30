" Vim color file
" Name:       joe.vim
" Maintainer: Joe joe@playmycode.com
" 
" My custom themed VIM theme.
" 

set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "joe"

" map a urxvt cube number to an xterm-256 cube number
fun! <SID>M(a)
	return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! <SID>X(a)
	if &t_Co == 88
		return a:a
	else
		if a:a == 8
			return 237
		elseif a:a < 16
			return a:a
		elseif a:a > 79
			return 232 + (3 * (a:a - 80))
		else
			let l:b = a:a - 16
			let l:x = l:b % 4
			let l:y = (l:b / 4) % 4
			let l:z = (l:b / 16)
			return 16 + <SID>M(l:x) + (6 * <SID>M(l:y)) + (36 * <SID>M(l:z))
		endif
	endif
endfun

hi Normal         gui=NONE   guifg=#eeeeee   guibg=#141414 ctermfg=white

" these are displayed with an alternative font which supports Unicode
hi Symbol         gui=NONE   guifg=#eeeeee   guibg=#141414

hi IncSearch      gui=BOLD   guifg=#303030   guibg=#cd8b60
hi Search         gui=NONE   guifg=#303030   guibg=#cd8b60
hi ErrorMsg       gui=BOLD   guifg=#ffffff   guibg=#ff3c3c
hi WarningMsg     gui=BOLD   guifg=#ffffff   guibg=#fca73f 
hi ModeMsg        gui=BOLD   guifg=#7e7eae   
hi MoreMsg        gui=BOLD   guifg=#7e7eae   
hi Question       gui=BOLD   guifg=#ffcd00   

hi StatusLine     gui=BOLD   guifg=#b9b9b9   guibg=#3e3e5e
hi StatusLineNC   gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e
hi VertSplit      gui=NONE   guifg=#4a4a4a

hi WildMenu       gui=BOLD   guifg=#eeeeee   guibg=#6e6eaf

hi MBENormal                 guifg=#E0E0E0   guibg=#2e2e3f
hi MBEChanged                guifg=#eeeeee   guibg=#2e2e3f
hi MBEVisibleNormal          guifg=#cfcfcd   guibg=#4e4e8f
hi MBEVisibleChanged         guifg=#eeeeee   guibg=#4e4e8f

hi DiffText       gui=NONE   guifg=#ffffcd   guibg=#4a2a4a
hi DiffChange     gui=NONE   guifg=#ffffcd   guibg=#306b8f
hi DiffDelete     gui=NONE   guifg=#ffffcd   guibg=#6d3030
hi DiffAdd        gui=NONE   guifg=#ffffcd   guibg=#306d30

hi Cursor         gui=NONE   guifg=#A7A7A7   guibg=#A7A7A7
hi lCursor        gui=NONE   guifg=#A7A7A7   guibg=#A7A7A7
hi CursorIM       gui=NONE   guifg=#A7A7A7   guibg=#A7A7A7
hi CursorLine     gui=NONE   guibg=#1d2328
hi CursorLine     gui=NONE   guibg=#1f1f1f   ctermbg=darkred 

hi Folded         gui=NONE   guifg=#cfcfcd   guibg=#4b208f
hi FoldColumn     gui=NONE   guifg=#8b8bcd   guibg=#2e2e2e

hi Directory      gui=NONE   guifg=#00ff8b   
hi LineNr         gui=NONE   guifg=#8A8A8A   ctermfg=yellow
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=#9A9A9A
hi NonText        gui=BOLD   guifg=#8b8bcd   
hi SpecialKey     gui=BOLD   guifg=#ab60ed   
hi Title          gui=BOLD   guifg=#af4f4b   
hi Visual         gui=NONE   guifg=#ffffff   guibg=#ff2377 ctermfg=white ctermbg=9

hi Comment        gui=NONE   guifg=#858EB1   ctermfg=3
hi LineComment    gui=NONE   guifg=#808080   ctermfg=3
hi DocComment     gui=NONE   guifg=#88FFFF   ctermfg=grey
hi Constant       gui=NONE   guifg=#CF6A4C   ctermfg=red
hi String         gui=NONE   guifg=#65B042   ctermfg=green
hi Error          gui=NONE   guifg=#ff00aa   guibg=#770000 ctermfg=white ctermbg=12
hi Identifier     gui=NONE   guifg=#DECF85   ctermfg=13
hi Number         gui=NONE   guifg=#CF6A4C   ctermfg=12
hi Ignore         gui=NONE   guifg=#8b8bcd   ctermfg=grey
hi PreProc        gui=NONE   guifg=#409090   ctermfg=cyan
hi Special        gui=NONE   guifg=#c080d0   
hi Statement      gui=NONE   guifg=#DECF85   ctermfg=yellow
hi Todo           gui=BOLD   guifg=#ffffff   guibg=#415168 ctermfg=black ctermfg=yellow
hi Type           gui=NONE   guifg=#DECF85   
hi Underlined     gui=BOLD   guifg=#ffffcd   ctermfg=yellow
hi TaglistTagName gui=BOLD   guifg=#808bed   

if v:version >= 700
    hi Pmenu          gui=NONE   guifg=#eeeeee   guibg=#4e4e8f
    hi PmenuSel       gui=BOLD   guifg=#eeeeee   guibg=#2e2e3f
    hi PmenuSbar      gui=BOLD   guifg=#eeeeee   guibg=#6e6eaf
    hi PmenuThumb     gui=BOLD   guifg=#eeeeee   guibg=#6e6eaf

    hi SpellBad     gui=undercurl guisp=#cc6666
    hi SpellRare    gui=undercurl guisp=#cc66cc
    hi SpellLocal   gui=undercurl guisp=#cccc66
    hi SpellCap     gui=undercurl guisp=#66cccc
endif

hi Documentation    gui=NONE   guifg=NONE   guibg=#171c20 ctermfg=NONE ctermbg=darkred

"+++ Cream:

" statusline
highlight User1  gui=NONE guifg=#7777aa guibg=#2e2e3f
highlight User2  gui=BOLD guifg=#b9b9b9 guibg=#2e2e3f
highlight User3  gui=BOLD guifg=#d0a060 guibg=#2e2e3f
highlight User4  gui=BOLD guifg=#cc00ff guibg=#2e2e3f

" bookmarks
highlight Cream_ShowMarksHL ctermfg=blue cterm=bold gui=BOLD guifg=#bb8bff
highlight SignColumn ctermfg=blue cterm=bold gui=BOLD guibg=#141414

" spell check
highlight BadWord ctermfg=black ctermbg=lightblue gui=NONE guifg=honeydew2 guibg=#602030

" current line
highlight CurrentLine term=reverse ctermbg=0 ctermfg=14 gui=none guibg=#202020

" email
highlight EQuote1 guifg=#ccccff
highlight EQuote2 guifg=#9999ff
highlight EQuote3 guifg=#3333ff
highlight Sig guifg=#999999

"+++

highlight ColorColumn ctermbg=darkgrey guibg=gray18

