
" 
" # Theme and Font
" 
" set custom theme settings
"
if has("win32")
    set gfn=Droid\ Sans\ Mono:h11
    set gfn+=DejaVu\ Sans\ Mono:h11
    set gfn+=Courier:h12
else
    "set guifont=DejaVu\ Sans\ Mono 11
    set guifont=DejaVu\ Sans\ Mono:h11
endif

if has('win32') || has('win64')
    " Make windows use ~/.vim too, and ensure vimfiles is found
    set runtimepath^=~/vimfiles
    set runtimepath^=~/.vim

    " hitting ctrl+z opens powershell
    nmap <C-Z> :silent !powershell<CR>
endif

if has("gui_running")
    color joe
endif

"
" # Printer Settings
"

command! -nargs=* Hardcopy call DoMyPrint('<args>')
function DoMyPrint(args)
  let colorsave=g:colors_name
  color print
  exec 'hardcopy '.a:args
  exec 'color '.colorsave
endfunction

"
" # Settings
"

" auto expand the file menu by default
let do_syntax_sel_menu=1

" colour column syntax highlighting
if version >= 703
    set colorcolumn=80
    highlight ColorColumn ctermbg=darkgrey guibg=gray18
end

" Remove menu bar
set guioptions-=T

cd ~
set autochdir

syntax on

set nocompatible
set number
set autoread
set smarttab
set autoindent smartindent
set lazyredraw
set ruler
set noerrorbells
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set spelllang=en_gb

" disable the (annoying) swap files you get with vim
set noswapfile

" allows me to walk anywhere on the screen
set virtualedit=block

filetype on

filetype plugin on
set ofu=syntaxcomplete#Complete

au BufNewFile,BufRead *.jsx set filetype=javascriptx
au BufNewFile,BufRead *.ts set filetype=typescript

" enable bracket matching highlighting
if exists("g:loaded_matchparen")
    unlet g:loaded_matchparen
endif
runtime plugin/matchparen.vim
DoMatchParen

"
" # Pathogen, vim auto-loader
"
" Allows files in ~/vimfiles and ~/.vim,
" to be found by vim proper, and loaded.
"

silent! execute pathogen#infect()

"
" # NerdTREE Settings
"

" z - toggles NERD Tree open / closed
nmap z :silent NERDTreeToggle<CR>

" closes NERD Tree, if it's the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" maps - and = for fast input, 
" replaces current line, with a line of ------'s or ====='s
nmap = <Enter>0d<S-L>79i=<Esc>k
nmap - <Enter>0d<S-L>79i-<Esc>k

" 
" # Swap Lines up and down
"
" move whole line up or down with ctrl+shift+j/k
"
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

" ctrl-shift-k and ctrl-shift-j swap lines up and down
noremap <c-s-k> :call <SID>swap_up()<CR>
noremap <c-s-j> :call <SID>swap_down()<CR>

"
" # Insert mode h/j/k/l movement
"
"
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

" 
" # Easier window navigation
"
" ctrl+w and then h/j/k/l, switches windows
" This maps those to just: ctrl+h, ctrl+j, ctrl+k and ctrl+l, for ease of use.

nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"
" # b#, alternatives
"

" ctrl-tab only works in gvim, and not terminal vim : (
if has("gui_running")
    nmap <C-Tab> :b#
endif

" ctrl + b swaps between current and last buffer, like ctrl+tab
nmap <c-b> :b#<cr>

" On wrapped lines, if you move down, vim will skip the next line by default.
" This is because it's not really a new line, it's the same line, wrapped.
" This mapping changes that, so it will move down a 'screen line' instead of a 'text line'.
nmap j gj
nmap k gk

"
" # Quick Escape
"
" 'kj' is an alternative to pressing escape.
" 'jh' is the same, but also undoes the entry.
"
imap kj <Esc>
imap jh <Esc>u

" Space appends a character, shift-space inserts a single character
nmap <Space> a_<Esc>r
nmap <S-Space> i_<Esc>r

" Move Text around with Alt+hjkl
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
nnoremap <A-h> <<
nnoremap <A-l> >>
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
inoremap <A-h> <Esc><<`]a
inoremap <A-l> <Esc>>>`]a
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
vnoremap <A-h> <gv
vnoremap <A-l> >gv

" Leave Insert after 15 seconds of no input
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore

" Remap :Q and :W to :q and :w, as they are common typos
command! Q :q
command! W :w

" H mapped to start of line, L mapped to end of line
map H ^
map L $

" Shift + k, is the opposite of shift + j.
" That combines lines, this seperates them.
nmap <S-k> <S-e>li<CR><Esc>

" Adds Ctrl-Tab for quick switching
map <C-tab> :b#<CR>

" Highlight conflicting markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Disable Code Folding
set nofoldenable

" Enter New lines above and below, without insert
map <S-Enter> O<Esc>
map <Enter> o<Esc>
map M mqr<Enter><Esc>'q$l

" Tab / Shift-Tab indentation
nnoremap <Tab> >>
nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" always show cursor line
hi CursorLine ctermbg=darkred guibg=#1f1f1f
windo set cursorline
redraw

" ~ and # search for the word under the caret, forward and back
let g:searchMoveIsDown = 1

nnoremap ? :let b:searchMoveIsDown = 0<CR>?
nnoremap / :let b:searchMoveIsDown = 1<CR>/
nnoremap ~ :let b:searchMoveIsDown = 0<CR>#
nnoremap # :let b:searchMoveIsDown = 1<CR>*

" Repeats the previous search, but always travelling in the same direction.
" So 'n' always searches for the next down, and 'N', is always up.
" Also pulses the current line.
"nnoremap N :call RepeatSearchUp()<cr>:call PulseCursorLine()<cr>
"nnoremap n :call RepeatSearchDown()<cr>:call PulseCursorLine()<cr>

nnoremap N :call RepeatSearchUp()<cr>
nnoremap n :call RepeatSearchDown()<cr>

function! RepeatSearchUp()
    if ( b:searchMoveIsDown == 0 )
        normal! n
    else
        normal! N
    end
endfunction

function! RepeatSearchDown()
    if ( b:searchMoveIsDown == 1 )
        normal! n
    else
        normal! N
    end
endfunction

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine ctermbg=darkred guibg=#1f1f1f
    redraw
    sleep 20m

    hi CursorLine ctermbg=darkred guibg=#2e2e2e
    redraw
    sleep 20m

    hi CursorLine ctermbg=darkred guibg=#303030
    redraw
    sleep 20m

    hi CursorLine ctermbg=red guibg=#383838
    redraw
    sleep 20m

    hi CursorLine ctermbg=red guibg=#404040
    redraw
    sleep 20m

    hi CursorLine ctermbg=red guibg=#383838
    redraw
    sleep 20m

    hi CursorLine ctermbg=red guibg=#303030
    redraw
    sleep 20m

    hi CursorLine ctermbg=red guibg=#2f2f2f
    redraw
    sleep 20m

    hi CursorLine ctermbg=darkred guibg=#1f1f1f
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

