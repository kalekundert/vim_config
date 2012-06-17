" Introduction
" ============
" This is a cool-themed color scheme for dark backgrounds.  It is supposed to
" work in the terminal and in the graphical interface.
"
" If you want to modify this file, search help for 'mysyntaxfile-replace' to
" get all the information you'll need.  To get a list of all the colors
" available, go to:
"
"     file:///~/ref/vim/256-color-chart.html    (On my laptop.)
"                          -or-
"     http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

" Bureaucratic stuff
highlight clear
if exists("syntax_on")
    syntax reset
endif

set t_Co=256
set background=dark

let g:colors_name = "dark"

" Defining the basic highlighting groups
highlight Normal            guifg=White      ctermfg=White      ctermbg=Black      guibg=Black
highlight Error             guifg=White      ctermfg=White      ctermbg=Red        guibg=Red

highlight Comment           guifg=DarkGray   ctermfg=LightGray  gui=italic     cterm=none 
highlight Todo              guifg=LightGray  ctermfg=LightGray  gui=none       cterm=none 

highlight Constant          guifg=White      ctermfg=White      gui=none       cterm=none 
highlight String            guifg=Green      ctermfg=Green       
highlight Number            guifg=White      ctermfg=White      gui=none       cterm=none 

highlight Statement         guifg=Blue       ctermfg=Blue       gui=none       cterm=none 
highlight Identifier        guifg=Yellow     ctermfg=Yellow     gui=none       cterm=none 
highlight Function          guifg=White      ctermfg=White      gui=none       cterm=none 
highlight Type              guifg=Cyan       ctermfg=Cyan       gui=none       cterm=none 

highlight PreProc           guifg=Blue       ctermfg=Blue       gui=none       cterm=none 

highlight Special           guifg=Green      ctermfg=Green      gui=none       cterm=none 
highlight SpecialComment    guifg=LightGray  ctermfg=LightGray  gui=none       cterm=none 

highlight SpellBad          guisp=DarkGray   ctermbg=DarkGray   gui=undercurl
highlight SpellCap          guisp=DarkGray   ctermbg=DarkGray   gui=undercurl
highlight SpellRare         guisp=DarkGray   ctermbg=DarkGray   gui=undercurl
highlight SpellLocal        guisp=DarkGray   ctermbg=DarkGray   gui=undercurl

highlight DiffAdd           guibg=Black      ctermbg=Black      gui=none
highlight DiffChange        guibg=Black      ctermbg=Black      gui=none
highlight DiffDelete        guibg=Black      ctermbg=Black      gui=none
highlight DiffText          guibg=DarkRed    ctermbg=DarkRed    gui=none

highlight Cursor            guifg=Black                         guibg=White
highlight LineNr            guifg=Black      ctermfg=Black      guibg=DarkGray   ctermbg=DarkGray
highlight NonText           guifg=White                         gui=bold

highlight Visual            guifg=Black      ctermfg=Black      guibg=LightGray  ctermbg=LightGray
highlight Folded            guifg=White      ctermfg=White      guibg=DarkBlue   ctermbg=DarkBlue
highlight MatchParen                                            guibg=Gray 

" Linked the less common groups to the basic ones
runtime shared.vim
