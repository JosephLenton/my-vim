
" 
" # Swap numbers and symbols round on the top row.
" 

" 
" Map each number to its shift-key character.
"
" Except for you Mr Pound, you never get used in vim!
" Instead the £ key is used for mapping to 'down and enter', which is for
" autocompletion
"

inoremap 1 !
inoremap 2 "
inoremap 3 £ 
inoremap 4 $
inoremap 5 %
inoremap 6 ^
inoremap 7 &
inoremap 8 *
inoremap 9 (
inoremap 0 )

" and then the opposite
inoremap ! 1
inoremap " 2
inoremap £ 3
inoremap $ 4
inoremap % 5
inoremap ^ 6
inoremap & 7
inoremap * 8
inoremap ( 9
inoremap ) 0

" this is for it working on the command line too
" (when you hit : to type a command)
cnoremap 1 !
cnoremap 2 "
cnoremap 3 £
cnoremap 4 $
cnoremap 5 %
cnoremap 6 ^
cnoremap 7 &
cnoremap 8 *
cnoremap 9 (
cnoremap 0 )

" and then the opposite
cnoremap ! 1
cnoremap " 2
cnoremap £ 3
cnoremap $ 4
cnoremap % 5
cnoremap ^ 6
cnoremap & 7
cnoremap * 8
cnoremap ( 9
cnoremap ) 0




