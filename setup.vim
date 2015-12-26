" Vim Extensions
" ==============
let g:pathogen_disabled = ['YouCompleteMe', 'jedi-vim']
    
call pathogen#infect()
call pathogen#helptags()

let g:easytags_dynamic_files = 1
let g:jedi#popup_on_dot = 0
"let g:jedi#completions_enabled = 0
let g:SuperTabDefaultCompletionType = "context"

map <C-n> :NERDTreeToggle<CR>
nmap <C-s> :FSHere<CR>

" General Options
" ===============
set nobackup
set wildignore=*.swp,*.pyc,*.class
set nocompatible
set cpoptions+=I
set autoread
set autowrite
set fileformat=unix
set fileformats=unix
set nospell
set spelllang=en_us
set printdevice=KortemmePrinter
set encoding=utf-8
set listchars=tab:→\ ,trail:·

command! Rc source $MYVIMRC

" Text Editing
" ============
retab
filetype plugin indent on

noremap Y y$
noremap q ge
noremap Q gE
noremap K gq
noremap j gj
noremap k gk
"noremap cx cc<Esc>
noremap ` q
noremap '' 'mzz
noremap == 1z=

let java_allow_cpp_keywords = 1
let python_highlight_exceptions = 1
let python_highlight_space_errors = 1
let python_no_builtin_highlight = 1
let fortran_dialect = 'f90'

autocmd FileType c,cpp set comments^=:///
autocmd FileType c,cpp set comments^=://!

abbreviate slef self
abbreviate {{{! {{{1
abbreviate }}}! }}}1
abbreviate {{{@ {{{2
abbreviate }}}@ }}}2

command! R 0r
let g:LargeFile=2500

" Text Formatting
" ===============
set backspace=indent,eol,start
set formatoptions=t,croq,wn
set shortmess+=I
set textwidth=79
set nowrap
set linebreak
set nonumber
set breakindent
set breakindentopt=sbr,shift:4
set showbreak=→\ 

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab

"let &formatlistpat='^\s*\d\+[\]:.)}\t]\s\+\|^\s*\w[\]:.)}]\s\+'
"let &formatlistpat='^# \d\+.\s'
"let &formatlistpat='^\s*\d\+[\]:.)}\t ]\s*'
"let &formatlistpat='^\s*[a-z1-9]\+[\]:.)}]\s*|^\s*[-*]\s*'
"let &formatlistpat='^\s*\(\(\d\+[\]:.)}\t ]\|[-∙]\)\s*'

let &formatlistpat='^\s*\([0-9]\+\|[a-z]\|[iv]\+\)[\].:)}]\s\+\|^\s*[-*]#\?\s\+\|^\.\.\s'
map <leader>K v}k:s/ *$/ /<CR>$x<C-O>gq}

autocmd FileType gitcommit set textwidth=72

" Text Searching
" ==============
set gdefault
set incsearch
set nohlsearch

nmap g/ /\<\><Left><Left>
nmap g? ?\<\><Left><Left>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute 'normal! vgvy'

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, '\n$', '', '')

    if a:direction == 'b'
        execute 'normal ?' . l:pattern . '^M'
    elseif a:direction == 'f'
        execute 'normal /' . l:pattern . '^M'
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" User Interface
" ==============
set mouse=""
set mousehide
set guioptions=ic
set guifont=Monospace\ 10
set laststatus=2
set showcmd
set ruler

set foldmethod=marker
"set scrolloff=5
set lazyredraw

if has('gui_running')
  set background=light
else
  set background=dark
  set t_Co=256
endif

function! FoldHighlight(level)
    return hlID('Folded' . a:level)
endfunction 

syntax enable
colorscheme solarized
silent! set foldhighlight=FoldHighlight(v:foldlevel)

map <F1> <Esc>
map! <F1> <Esc>

map <C-j> <C-e>
map <C-k> <C-y>

nnoremap <Tab> :

command! W w
command! Q q
command! Wq wq
command! WQ wq

"let &printexpr="(v:cmdarg=='' ? ".
"    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
"    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
"    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

" vim: nofoldenable
