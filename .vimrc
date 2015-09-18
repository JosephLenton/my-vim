
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
if has("win32") || has('win64')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" set the default Font; syntax depends on the OS
if has("win32") || has('win64')
    set guifont=Press\ Start\ 2P:h9
    set guifont+=Fantasque\ Sans\ Mono:h12
    set guifont+=Envy\ Code\ R:h11:i
    set guifont+=Consolas:h12
    set guifont+=DejaVu\ Sans\ Mono:h11
else
    set guifont=DejaVu\ Sans\ Mono\ 11
    set guifont+=Droid\ Sans\ Mono\ 11
    set guifont+=Monospace\ 11
endif

set lsp=9

" offer UNIX vim locations on Windows
if has('win32') || has('win64')
  set runtimepath^=$HOME/.vim,$HOME/.vim/colors,$HOME/.vim/syntax,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" hitting ctrl+z opens powershell
if has('win32') || has('win64')
    nmap <C-Z> :silent !powershell<CR>
endif

" enabme full colour support on Linux
if has('win32') || has('win64')
else
    set t_Co=256
endif



" start Vim maximized
au GUIEnter * simalt ~x

" use my own colour scheme (which I designed : D)
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

" line number setup
set number
set numberwidth=10
"set relativenumber

let g:vimroom_sidebar_height = 0

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
" # Remove whitespace from empty lines in code files.
"
"------------------------------------------------------------------------------

autocmd FileType c,cpp,java,php,scala,ruby,javascript,js,css,stylus,styl autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" beta
inoremap <A-b> β

" gamma 
inoremap <A-g> γ
inoremap <A-G> Γ

" delta
inoremap <A-d> δ
inoremap <A-D> Δ

" epsilon
inoremap <A-e> ε
 
" sigma
inoremap <A-s> σ
inoremap <A-S> ∑

" tau!
inoremap <A-t> τ

" Lambda
inoremap <A-l> λ
inoremap <A-L> Λ

" Mu
inoremap <A-m> μ

" Tau alt+t
inoremap <A-t> τ

" Theta alt+T
inoremap <A-T> Θ

" Omega
inoremap <A-o> ω
inoremap <A-O> Ω

" Pi
inoremap <A-p> π
inoremap <A-P> Π

" Phi (f like 'fi')
inoremap <A-f> φ
inoremap <A-F> Φ

" Psi (like a y)
inoremap <A-y> ψ
inoremap <A-Y> Ψ

" comparisons

" alt + ! is not equal
inoremap <A-1> ≠

" alt + = is 'identical equal' (triple equal)
inoremap <A-=> ≡

" alt + less than, is less than equal
inoremap <A-<> ≤

" alt + greater than, is greater than equal
inoremap <A->> ≥

" right arrow
inoremap <A-right> →
inoremap <A-S-right> ⇒

" left arrow
inoremap <A-left> ←
inoremap <A-S-left> ⇐

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
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

" m, horizontal split
" M, vertical split
nnoremap m <c-w>v
nnoremap M <c-w>s

" vertical to horizontal & horizontal to vertical
nnoremap <c-n> <c-w>t<c-w>K
nnoremap <c-m> <c-w>t<c-w>H



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
"   ctrl + h / l
"   shift + tab
nnoremap <c-h> <<
nnoremap <c-l> >>
vnoremap <c-l> >gv
vnoremap <c-h> <gv

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
nnoremap ~ :let b:searchMoveIsDown = 0<CR>#
nnoremap # :let b:searchMoveIsDown = 1<CR>*

" Repeats the previous search, but always travelling in the same direction.
" So 'n' always searches for the next down, and 'N', is always up.
" Also pulses the current line.
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

