
" set custom theme settings
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
endif

if has("gui_running")
    color joe
endif

syntax on

execute pathogen#infect()

" z - toggles NERD Tree open / closed
nmap z :NERDTreeToggle<CR>

" closes NERD Tree, if it's the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

set spelllang=en_gb

filetype on

filetype plugin on
set ofu=syntaxcomplete#Complete

" move whole line up or down with ctrl+j/k
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

noremap <c-k> :call <SID>swap_up()<CR>
noremap <c-j> :call <SID>swap_down()<CR>

" enable bracket matching highlighting
if exists("g:loaded_matchparen")
    unlet g:loaded_matchparen
endif
runtime plugin/matchparen.vim
DoMatchParen

" On wrapped lines, if you move down, vim will skip the next line by default.
" This is because it's not really a new line, it's the same line, wrapped.
" This mapping changes that, so it will move down a 'screen line' instead of a 'text line'.
:nmap j gj
:nmap k gk

" keep VIM in Expert mode
nmap <Esc> <Nop>

" disable the (annoying) swap files you get with vim
set noswapfile

" allows me to walk anywhere on the screen
set virtualedit=block

" has Cream start in Expert mode, not insert
set noinsertmode

" quick escape from insert mode using 'kj'
imap kj <Esc>

" ~ and # search for the word under the caret, forward and back
nnoremap ~ #
nnoremap # *

" Space appends a character, shift-space inserts a single character
nmap <Space> a_<Esc>r
nmap <S-Space> i_<Esc>r

" Remove menu bar
set guioptions-=T

" Remove line wrapping
set nowrap

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

" Remap K to *, as it's annoying that it opens help
map K *

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

hi CursorLine guibg=#1f1f1f

" Pulses the current line
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

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

    hi CursorLine guibg=#1f1f1f
    redraw
    sleep 20m

    hi CursorLine guibg=#2e2e2e
    redraw
    sleep 20m

    hi CursorLine guibg=#303030
    redraw
    sleep 20m

    hi CursorLine guibg=#383838
    redraw
    sleep 20m

    hi CursorLine guibg=#404040
    redraw
    sleep 20m

    hi CursorLine guibg=#383838
    redraw
    sleep 20m

    hi CursorLine guibg=#303030
    redraw
    sleep 20m

    hi CursorLine guibg=#2f2f2f
    redraw
    sleep 20m

    hi CursorLine guibg=#1f1f1f
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction


