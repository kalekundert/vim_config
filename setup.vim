" Look into getting the :make command set up.  It looks like it could save
" a lot of time, plus I would learn to use make.
"
" Here are some relevant help topics:
"   :h make
"   :h quickfix
" 
" Here are some relevant options:
"   makeprg
"   makeef
"   shellpipe

" Autocommands
" ============
" I might be able to use autocommands to automatically update my syntax files
" upon being opened.  (i.e. adding types)
"
" Surround
" ========
" Also, I just stumbled across a vim plugin called surround, which is meant to
" help deal with quotes, braces, parentheses, and anything else surrounding a
" block of text.  The URL is:
"
"     http://www.vim.org/scripts/script.php?script_id=1697

set nocompatible

set nobackup
set cpoptions+=I
set backspace=indent,eol,start
set wildignore=*.swp,*.pyc,*.class
set shortmess+=I

set formatoptions=tcrq
set guioptions=ic
set guifont=Monospace\ 10
set laststatus=2

set mouse=""
set mousehide

set ruler
set showcmd
set scrolloff=5

set nowrap
set textwidth=79

set gdefault
set incsearch
set nohlsearch

set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab

set nospell
set spelllang=en_us

set autoread
set autowrite

set fileformat=unix
set fileformats=unix

set foldcolumn=0
set foldmethod=marker
set printdevice=GrayScale

" Below is a script that I found on the web that makes vim print to postscript
" files.  To use it, just remove the comment leaders and source this file.

let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

map Y y$
map q ge
map Q gE
map K gq
noremap gq q


map '' 'mzz
map == 1z=

" This may be an easier way to enter normal mode.  Note that Ctrl-C is another
" way to switch from insert mode to normal mode.
"inoremap C-j <esc>
"inoremap <esc> <nop>

" Maps the F1 key to Esc, since I tend to hit F1 when I'm trying to enter
" normal mode.
map <F1> <Esc>
map! <F1> <Esc>

" This makes :W and :Wq work just like :w and :wq.  
command W w
command Q q
command Wq wq
command WQ wq

" This causes the '?' key to behave like the '/' key, except the regular
" expression used to search for whole words is entered automatically.
"nmap ? /\<\><Left><Left>

retab
filetype plugin indent on

let java_allow_cpp_keywords = 1
let python_highlight_exceptions = 1
let python_highlight_space_errors = 1
let python_no_builtin_highlight = 1
let fortran_dialect = "f77"
let fortran_have_tabs = 1
let fortran_fixed_source = 1

abbreviate slef self
abbreviate {{{! {{{1
abbreviate }}}! }}}1
abbreviate {{{@ {{{2
abbreviate }}}@ }}}2

if has("gui_running")
    colorscheme light

    function! MyFoldHi(level)
            return hlID("Folded".a:level)
    endfunction 

else
    colorscheme dark

    function! MyFoldHi(level)
            return hlID("Folded")
    endfunction 

endif

" Try to color folds based on their level, but don't complain if the source
" patch isn't installed.

silent! setlocal foldhighlight=MyFoldHi(v:foldlevel)

syntax enable

" vim: nofoldenable
