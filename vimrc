" this section for basic stuff
set nocompatible
syntax on
set term=xterm-256color
set t_Co=256
colorscheme Monokai

set backspace=indent,eol,start
"set number
"set background=dark
"set background=light

set ruler
set autoindent

set tabstop=4
set softtabstop=4 " delete will act like delete on tab (delete all spaces)
set expandtab
autocmd FileType make setlocal noexpandtab
autocmd BufEnter * :syntax sync fromstart

" different indent for different file types
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" hack for perl t/*.t module test files
autocmd FileType tads set filetype=perl

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set shiftwidth=4
set shiftround

set encoding=utf8
set fileformats=unix,dos

set showmatch
set scrolloff=10

"allow one-line scroll from within insert mode
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>

"==========================================================
" this section for fancier setup

" allow shift+TAB to create a real TAB (for makefiles)
inoremap <S-Tab> <C-V><Tab>

" display real TABs as >---
set listchars=tab:>-
set list

" then also colour real TAB areas blue
highlight TabChar ctermfg=lightblue
match TabChar /\t/

highlight All cterm=NONE ctermfg=2 ctermbg=black
au BufNewFile,BufRead *.tt2 set filetype=html
au BufNewFile,BufRead *.tt set filetype=html

" nicer colour for comments and line numbers
"highlight Comment ctermfg=DarkGreen 
"highlight LineNr  ctermfg=DarkGreen 

" highlight the character on col 79
"highlight Col79 ctermbg=red
"match Col79 /\%<80v.\%>79v/

"==========================================================
" this section for hotkey toggle setup

" hotkey F2 to reformat current paragraph
map <F2> gq}

" hotkey F5 to toggle highlighting of real TABs
nnoremap \tl :set invlist list?<CR>
nmap <F5> \tl
imap <F5> <C-O>\tl

" hotkey F4 toggles highlighting search locations
nnoremap \th :set invhls hls?<CR>
nmap <F4> \th
imap <F4> <C-O>\th

" default is to have wrapping ON
set wrap
set sidescroll=5
set listchars+=precedes:<,extends:>

" by default text will not be auto-wrapped at 78 chars,
" but setup hotkey F6 to toggle this on and off.
" the VimEnter autocmd line is needed due to a Fedora bug
set textwidth=78
autocmd VimEnter * set formatoptions-=t
nnoremap \tf :if &fo =~ 't' <Bar> set fo-=t <Bar>  else <Bar> set fo+=t <Bar>  endif <Bar> set invwrap wrap?<CR>
nmap <F6> \tf
imap <F6> <C-O>\tf

" hotkey F7 to toggle paste mode
nnoremap \tp :set invpaste paste?<CR>
nmap <F7> \tp
imap <F7> <C-O>\tp
set pastetoggle=<F11>

" hotkey F8 to toggle line numbers
nnoremap \tn :set invnumber number?<CR>
nmap <F8> \tn
imap <F8> <C-O>\tn

" w!! if root privileges are required
cmap w!! %!sudo tee > /dev/null %

"==========================================================
" this section for memos...

":TOhtml

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
