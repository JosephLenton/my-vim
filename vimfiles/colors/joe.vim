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

if has("gui_running")
	hi Normal         gui=NONE   guifg=#eeeeee   guibg=#141414

	hi IncSearch      gui=BOLD   guifg=#303030   guibg=#cd8b60
	hi Search         gui=NONE   guifg=#303030   guibg=#cd8b60
	hi ErrorMsg       gui=BOLD   guifg=#ffffff   guibg=#ff3c3c
	hi WarningMsg     gui=BOLD   guifg=#ffffff   guibg=#fca73f 
	hi ModeMsg        gui=BOLD   guifg=#7e7eae   
	hi MoreMsg        gui=BOLD   guifg=#7e7eae   
	hi Question       gui=BOLD   guifg=#ffcd00   

	hi StatusLine     gui=BOLD   guifg=#b9b9b9   guibg=#3e3e5e
	hi StatusLineNC   gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e
	hi VertSplit      gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e

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

	hi Folded         gui=NONE   guifg=#cfcfcd   guibg=#4b208f
	hi FoldColumn     gui=NONE   guifg=#8b8bcd   guibg=#2e2e2e

	hi Directory      gui=NONE   guifg=#00ff8b   
	hi LineNr         gui=NONE   guifg=#8A8A8A   guibg=#2E3436
	hi NonText        gui=BOLD   guifg=#8b8bcd   
	hi SpecialKey     gui=BOLD   guifg=#ab60ed   
	"hi Title          gui=BOLD   guifg=#af4f4b   guibg=#141414
	hi Title          gui=BOLD   guifg=#af4f4b   
	hi Visual         gui=NONE   guifg=#ffffff   guibg=#ff2377

	hi Comment        gui=NONE   guifg=#858EB1   
	hi LineComment    gui=NONE   guifg=#808080   
	hi DocComment     gui=NONE   guifg=#88FFFF   
	hi Constant       gui=NONE   guifg=#CF6A4C   
	hi String         gui=NONE   guifg=#65B042   
	hi Error          gui=NONE   guifg=#ffffff   guibg=#6e2e2e
	hi Identifier     gui=NONE   guifg=#DECF85   
	hi Number         gui=NONE   guifg=#CF6A4C   
	hi Ignore         gui=NONE   guifg=#8b8bcd   
	hi PreProc        gui=NONE   guifg=#409090   
	hi Special        gui=NONE   guifg=#c080d0   
	hi Statement      gui=NONE   guifg=#DECF85   
	hi Todo           gui=BOLD   guifg=#ffffff   guibg=#415168
	hi Type           gui=NONE   guifg=#DECF85   
	hi Underlined     gui=BOLD   guifg=#ffffcd   
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

	hi LineHighlight        gui=NONE   guifg=NONE   guibg=#171c20

    hi CursorLine gui=NONE guibg=#1f1f1f
    hi CursorLine gui=NONE guibg=#1d2328
else
	exec "hi Normal         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(80)
	exec "hi IncSearch      cterm=BOLD   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(73)
	exec "hi Search         cterm=NONE   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(73)
	exec "hi ErrorMsg       cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(48)
	exec "hi WarningMsg     cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(68)
	exec "hi ModeMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
	exec "hi MoreMsg        cterm=BOLD   ctermfg=" . <SID>X(38) . " ctermbg=" . "NONE"
	exec "hi Question       cterm=BOLD   ctermfg=" . <SID>X(52) . " ctermbg=" . "NONE"

	exec "hi StatusLine     cterm=BOLD   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
	exec "hi StatusLineNC   cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)
	exec "hi VertSplit      cterm=NONE   ctermfg=" . <SID>X(84) . " ctermbg=" . <SID>X(81)

	exec "hi WildMenu       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)

	exec "hi MBENormal                   ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(81)
	exec "hi MBEChanged                  ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(81)
	exec "hi MBEVisibleNormal            ctermfg=" . <SID>X(85) . " ctermbg=" . <SID>X(82)
	exec "hi MBEVisibleChanged           ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)

	exec "hi DiffText       cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(34)
	exec "hi DiffChange     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(17)
	exec "hi DiffDelete     cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
	exec "hi DiffAdd        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(20)

	exec "hi Cursor         cterm=NONE   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(38)
	exec "hi lCursor        cterm=NONE   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(38)
	exec "hi CursorIM       cterm=NONE   ctermfg=" . <SID>X(80) . " ctermbg=" . <SID>X(38)

	exec "hi Folded         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(35)
	exec "hi FoldColumn     cterm=NONE   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(80)

	exec "hi Directory      cterm=NONE   ctermfg=" . <SID>X(28) . " ctermbg=" . "NONE"
	exec "hi LineNr         cterm=NONE   ctermfg=" . <SID>X(39) . " ctermbg=" . <SID>X(80)
	exec "hi NonText        cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"
	exec "hi SpecialKey     cterm=BOLD   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
	exec "hi Title          cterm=BOLD   ctermfg=" . <SID>X(48) . " ctermbg=" . "NONE"
	exec "hi Visual         cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(38)

	exec "hi Comment        cterm=NONE   ctermfg=" . <SID>X(52) . " ctermbg=" . "NONE"
	exec "hi Constant       cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . "NONE"
	exec "hi String         cterm=NONE   ctermfg=" . <SID>X(73) . " ctermbg=" . <SID>X(81)
	exec "hi Error          cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
	exec "hi Identifier     cterm=NONE   ctermfg=" . <SID>X(53) . " ctermbg=" . "NONE"
	exec "hi Ignore         cterm=NONE   ctermfg=" . <SID>X(22) . " ctermbg=" . "NONE"
	exec "hi Number         cterm=NONE   ctermfg=" . <SID>X(69) . " ctermbg=" . "NONE"
	exec "hi PreProc        cterm=NONE   ctermfg=" . <SID>X(25) . " ctermbg=" . "NONE"
	exec "hi Special        cterm=NONE   ctermfg=" . <SID>X(55) . " ctermbg=" . "NONE"
	exec "hi Statement      cterm=NONE   ctermfg=" . <SID>X(27) . " ctermbg=" . "NONE"
	exec "hi Todo           cterm=BOLD   ctermfg=" . <SID>X(16) . " ctermbg=" . <SID>X(57)
	exec "hi Type           cterm=NONE   ctermfg=" . <SID>X(71) . " ctermbg=" . "NONE"
	exec "hi Underlined     cterm=BOLD   ctermfg=" . <SID>X(77) . " ctermbg=" . "NONE"
	exec "hi TaglistTagName cterm=BOLD   ctermfg=" . <SID>X(39) . " ctermbg=" . "NONE"

	if v:version >= 700
		exec "hi Pmenu          cterm=NONE   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(82)
		exec "hi PmenuSel       cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(38)
		exec "hi PmenuSbar      cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)
		exec "hi PmenuThumb     cterm=BOLD   ctermfg=" . <SID>X(87) . " ctermbg=" . <SID>X(39)

		exec "hi SpellBad       cterm=NONE ctermbg=" . <SID>X(32)
		exec "hi SpellRare      cterm=NONE ctermbg=" . <SID>X(33)
		exec "hi SpellLocal     cterm=NONE ctermbg=" . <SID>X(36)
		exec "hi SpellCap       cterm=NONE ctermbg=" . <SID>X(21)
	endif
endif

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

