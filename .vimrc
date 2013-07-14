"*******
"Bundles
"*******

call pathogen#infect()                      "enable pathogen
let g:neocomplcache_enable_at_startup = 1   "enable neocomplcache
Helptags                                    "merge in pathogens helptags


"*********
"Syntastic
"*********

"disable for java
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby', 'python', 'js'],
            \ 'passive_filetypes': ['java'] }

"*****
"CtrlP
"*****

let g:ctrlp_show_hidden = 1

"************
"Autocommands
"************

"cd into current directory
au BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

"enable cl on active window
au WinEnter,FocusGained * set cursorline

"disable cl on inactive window
au WinLeave,FocusLost * set nocursorline

"remove trailing whitespace
au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"reload .vimrc on write
au BufWritePost .vimrc so ~/.vimrc

"wrap text at 80
au BufRead *.txt set textwidth=80

"vim-hdevtool bindings
au FileType haskell nnoremap <buffer> _t :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> _T :HdevtoolsClear<CR>

au BufRead *.page set ft=markdown

"********
"Settings
"********
set directory=/tmp          "don't clutter with .swp's
set backupdir=/tmp

colorscheme inkpot          "because it's pretteh

set nocompatible            "screw vi

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

set encoding=utf-8
let g:Powerline_symbols = 'fancy'

set wildmode=list:longest,full
set omnifunc=syntaxcomplete#Complete

set nofoldenable            "unfold

set foldnestmax=5           "don't fold too far
set foldlevel=1             "start at 1
set foldmethod=indent       "fold on indentation

set smartindent             "smart indenting for c-like languages
set expandtab               "use spaces instead of tab characters
set shiftwidth=4            "number of spaces used for indentation
set tabstop=4               "number of spaces the tab character uses
set softtabstop=4           "number of spaces the tab character looks like

if version > 700
    set spl=en spell        "set spell to english
    set nospell             "but turn it off by default
endif

set mouse=a                 "enable the mouse
set mousehide               "hide the pointer when typing

set ignorecase              "ignore casing in search patterns
set smartcase               "unless you specify casing
set hlsearch                "highlight search results
nohls                       "but turn of hl from previous run

set hidden                  "allow buffer switching without saves

highlight MatchParent ctermbg=4

set magic                   "it's a kinda

set wrap                    "wrap lines
set linebreak               "instert linebreaks when wrapping

set cursorline              "highlight the current line

set shell=bash

set nolist                    "show special characters

"set haskell unicode
let g:haskell_conceal_wide = 1

set foldcolumn=2

"********
"Mappings
"********

let mapleader = ","

"toggle line numbers
nmap <leader>l :set invnu<cr>

"toggle between last alternate buffer
nnoremap <Leader><Leader> <C-^>

"under- or overline the current line
nnoremap <leader>== yyPv$r=jyypv$r=
nnoremap <leader>** yyPv$r*jyypv$r*
nnoremap <leader>= yypv$r=
nnoremap <leader>- yypv$r-
nnoremap <leader>^ yypv$r^
nnoremap <leader>" yypv$r"

"make Y consistent with D and C
map Y y$

"fix indentation
noremap <F1> mzgg=G`zzz

"graphical undo
nnoremap <F2> :GundoToggle<CR>

"make j and k work on wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

"toggle folds with space
nnoremap <space> za

"set enter to write
nmap <CR> :write<CR>

"easier split window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

"toggle search highlight
nnoremap <silent><Leader>/ :nohls<cr>

"control-p plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""""""""""""""""""""""""""
" cmldline-window mappings
""""""""""""""""""""""""""
" Swap default ':', '/' and '?' with cmdline-window equivalent.
"nnoremap : q:i
"xnoremap : q:i
"nnoremap / q/i
"xnoremap / q/i
"nnoremap ? q?i
"xnoremap ? q?i
"nnoremap q: :
"xnoremap q: :
"nnoremap q/ /
"xnoremap q/ /
"nnoremap q? ?
"xnoremap q? ?
" Have <esc> leave cmdline-window
autocmd CmdwinEnter * nnoremap <buffer> <esc> :q<cr>

""""""""""""""""""""""""""""""
" => neocomplcache plugin
""""""""""""""""""""""""""""""
" TODO: Still need to tweak behavior with <TAB> to expand
"       snippets, change throughout the autocompletion list

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_snippets_dir = '~/.vim/snippet/'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
