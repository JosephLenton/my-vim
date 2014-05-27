
"==============================================================================
"
"       .vimrc
"
" My own .vimrc settings. It aims to be independant of the plugins also
" included, so this could be used without them.
"
"==============================================================================

"------------------------------------------------------------------------------
" 
" # Theme and Font
" 
" set custom theme settings
"
"------------------------------------------------------------------------------

" join Vim's copy/paste buffer to the OS clipboard, so they are one
if has("win32")
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" set the default Font; syntax depends on the OS
if has("win32")
    set gfn=DejaVu\ Sans\ Mono:h11
    set gfn+=Consolas:h12
else
    set guifont=DejaVu\ Sans\ Mono\ 11
    set guifont+=Droid\ Sans\ Mono\ 11
    set guifont+=Monospace\ 11
endif

" offer UNIX vim locations on Windows
if has('win32') || has('win64')
  set runtimepath^=$HOME/.vim,$HOME/.vim/colors,$HOME/.vim/syntax,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" hitting ctrl+z opens powershell
if has('win32') || has('win64')
    nmap <C-Z> :silent !powershell<CR>
endif

" use my own colour scheme, which I designed : D
color joe

"------------------------------------------------------------------------------
"
" # Settings
"
"------------------------------------------------------------------------------

" auto expand the file menu by default
let do_syntax_sel_menu=1

" colour column syntax highlighting (Vim 7.3+ only)
if version >= 703
    set colorcolumn=80
    highlight ColorColumn ctermbg=darkgrey guibg=gray18
end

" Remove menu bar
set guioptions-=T
set guioptions-=m

if ( isdirectory($HOME . "/projects") )
    cd ~/projects
else
    cd ~
endif
set autochdir

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
set incsearch

set relativenumber
set numberwidth=10

" sets spaces to the vertical window splits
set fillchars+=vert:\  

" disable the (annoying) swap files you get with vim
set noswapfile

" allows me to walk anywhere on the screen
set virtualedit=block



"------------------------------------------------------------------------------
"
" # Pathogen, vim auto-loader
"
" Allows files in ~/vimfiles and ~/.vim,
" to be found by vim proper, and loaded.
"
"------------------------------------------------------------------------------

silent! execute pathogen#infect()
silent! call pathogen#runtime_append_all_bundles()

" syntax highlighting must be turned off/on *after* pathagen loaded
filetype off
syntax on
filetype plugin on

set ofu=syntaxcomplete#Complete



"------------------------------------------------------------------------------
" 
" # Syntax highlighting for new file types
"
"------------------------------------------------------------------------------

au BufNewFile,BufRead *.jsx set filetype=javascriptx
au BufNewFile,BufRead *.ts  set filetype=typescript
au BufNewFile,BufRead *.pro set filetype=prolog
au BufNewFile,BufRead *.vimperatorrc set filetype=vim



"------------------------------------------------------------------------------
"
" Bracket Matching Highlighting
"
"------------------------------------------------------------------------------

if exists("g:loaded_matchparen")
    unlet g:loaded_matchparen
endif
runtime plugin/matchparen.vim
DoMatchParen

" Column scroll-binding on <leader>sb
noremap z :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>



"------------------------------------------------------------------------------
" 
" # Auto-run make for .jsx files
"
"------------------------------------------------------------------------------

call FindMake#runOnSave( "*.jsx" )



"------------------------------------------------------------------------------
"
" # NerdTREE Settings
"
"------------------------------------------------------------------------------

" z - toggles NERD Tree open / closed
nmap <silent> <leader>z :silent NERDTreeToggle<CR>

" closes NERD Tree, if it's the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" maps - and = for fast input, 
" replaces current line, with a line of ------'s or ====='s
nmap = <Enter>0d<S-L>79i=<Esc>k
nmap - <Enter>0d<S-L>79i-<Esc>k



"------------------------------------------------------------------------------
" 
" Enable Airline
"
" I was not fully taken with airline, so it's currently disabled. Will make 
" more sense if I open multiple files within the same vim instance.
"
" Until then, I will leave this commented out.
"
"------------------------------------------------------------------------------

"set laststatus=2
"let g:airline#extensions#tagbar#enabled = 1



"------------------------------------------------------------------------------
"
" # change replace letter
"
" r normally replaces just a letter, however I have changed it to 'change
" word'.
"
"------------------------------------------------------------------------------

nnoremap r cw



"------------------------------------------------------------------------------
"
" # inoremappings!
"
"------------------------------------------------------------------------------

" # s-space writes an underscore

inoremap <S-Space> _



" # Insert mode h/j/k/l movement

inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-h> <left>
inoremap <C-l> <right>



" # Insert mode backspace and new lines

inoremap <S-Enter> <C-o><S-Enter>i
inoremap <c-y> <BS>
inoremap <c-u> <Enter>
inoremap <c-s-u> <S-Enter>

"------------------------------------------------------------------------------
"
" # Unicode
"
" Alt + key, will print out a unicode version. For example Alt + p does pi,
" and Alt + right does a right arrow.
"
"------------------------------------------------------------------------------

set encoding=utf-8
set winaltkeys=no

" alpha
inoremap <A-a> α
nmap <A-a> i<A-a><Esc>

" beta
inoremap <A-b> β
nmap <A-b> i<A-b><Esc>

" gamma 
inoremap <A-g> γ
nmap <A-g> i<A-g><Esc>
inoremap <A-G> Γ
nmap <A-G> i<A-G><Esc>

" delta
inoremap <A-d> δ
nmap <A-d> i<A-d><Esc>
inoremap <A-D> Δ
nmap <A-D> i<A-D><Esc>

" epsilon
inoremap <A-e> ε
nmap <A-e> i<A-e><Esc>
 
" sigma
inoremap <A-s> σ
nmap <A-s> i<A-s><Esc>
inoremap <A-S> ∑
nmap <A-S> i<A-S><Esc>

" tau!
inoremap <A-t> τ
nmap <A-t> i<A-t><Esc>

" Lambda
inoremap <A-l> λ
nmap <A-l> i<A-l><Esc>
inoremap <A-L> Λ
nmap <A-L> i<A-L><Esc>

" Mu
inoremap <A-m> μ
nmap <A-m> i<A-m><Esc>

" Tau alt+t
inoremap <A-t> τ
nmap <A-t> i<A-t><Esc>

" Theta alt+T
inoremap <A-T> Θ
nmap <A-T> i<A-T><Esc>

" Omega
inoremap <A-o> ω
nmap <A-o> i<A-o><Esc>
inoremap <A-O> Ω
nmap <A-O> i<A-O><Esc>

" Pi
inoremap <A-p> π
nmap <A-p> i<A-p><Esc>
inoremap <A-P> Π
nmap <A-P> i<A-P><Esc>

" Phi (f like 'fi')
inoremap <A-f> φ
nmap <A-f> i<A-f><Esc>
inoremap <A-F> Φ
nmap <A-F> i<A-F><Esc>

" Psi (like a y)
inoremap <A-y> ψ
nmap <A-y> i<A-y><Esc>
inoremap <A-Y> Ψ
nmap <A-Y> i<A-Y><Esc>

" comparisons

" alt + ! is not equal
inoremap <A-1> ≠
nmap <A-1> i<A-1><Esc>

" alt + = is 'identical equal' (triple equal)
inoremap <A-=> ≡
nmap <A-=> i<A-><Esc>

" alt + less than, is less than equal
inoremap <A-<> ≤
nmap <A-<> i<A-<><Esc>

" alt + greater than, is greater than equal
inoremap <A->> ≥
nmap <A->> i<A->><Esc>

" right arrow
inoremap <A-right> →
nmap <A-right> i<A-right><Esc>
inoremap <A-S-right> ⇒
nmap <A-S-right> i<A-S-right><Esc>

" left arrow
inoremap <A-left> ←
nmap <A-left> i<A-left><Esc>
inoremap <A-S-left> ⇐
nmap <A-S-left> i<A-S-left><Esc>

"------------------------------------------------------------------------------
" 
" # Swap Lines up and down
"
" move whole line up or down with ctrl+shift+j/k
"
"------------------------------------------------------------------------------

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



"------------------------------------------------------------------------------
" 
" # Easier window navigation
"
"------------------------------------------------------------------------------

" ctrl+w and then h/j/k/l, switches windows
" This maps those to just: ctrl+h, ctrl+j, ctrl+k and ctrl+l, for ease of use.
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" m, horizontal split
" M, vertical split
nnoremap m <c-w>v
nnoremap M <c-w>s

" vertical to horizontal & horizontal to vertical
nnoremap <c-n> <c-w>t<c-w>K
nnoremap <C-m> <c-w>t<c-w>H



"------------------------------------------------------------------------------
"
" # b#, alternatives
"
"------------------------------------------------------------------------------

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

"------------------------------------------------------------------------------
"
" # Quick Escape
"
" 'kj' is an alternative to pressing escape.
" 'jh' is the same, but also undoes the entry.
"
"------------------------------------------------------------------------------

imap kj <Esc>
imap jh <Esc>u

" using kj in the command line executes the command
cmap kj <Enter>

" Space appends a character, shift-space inserts a single character
nmap <Space> a_<Esc>r
nmap <S-Space> i_<Esc>r

" Move Text around with Alt+hjkl
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
nnoremap <A-h> <<
nnoremap <A-l> >>
"inoremap <A-j> <Esc>:m+<CR>==gi
"inoremap <A-k> <Esc>:m-2<CR>==gi
"inoremap <A-h> <Esc><<`]a
"inoremap <A-l> <Esc>>>`]a
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
function! SplitLine()
    if getline(".")[col(".")-1] != ' '
        normal! E
    end

    call feedkeys( "a\<cr>\<esc>" )
endfunction

nmap <S-k> :call SplitLine()<cr>

" Adds Ctrl-Tab for quick switching
nnoremap <C-tab> :b#<CR>

" Highlight conflicting markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Disable Code Folding
set nofoldenable

" Enter New lines above and below, without insert
map <S-Enter> O<Esc>
map <Enter> o<Esc>

" Tab / Shift-Tab indentation
nnoremap <Tab> >>
nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" always show cursor line
windo set cursorline
redraw

" ~ and # search for the word under the caret, forward and back
let b:searchMoveIsDown = 1

nnoremap ? :let b:searchMoveIsDown = 0<CR>?
nnoremap / :let b:searchMoveIsDown = 1<CR>/
nnoremap ~ :let b:searchMoveIsDown = 0<CR>#:call PulseCursorLine()<cr>
nnoremap # :let b:searchMoveIsDown = 1<CR>*:call PulseCursorLine()<cr>

" Repeats the previous search, but always travelling in the same direction.
" So 'n' always searches for the next down, and 'N', is always up.
" Also pulses the current line.
nnoremap N :call RepeatSearchUp()<cr>:call PulseCursorLine()<cr>
nnoremap n :call RepeatSearchDown()<cr>:call PulseCursorLine()<cr>

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

