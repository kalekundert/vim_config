" Introduction
" ============
" This color scheme attempts to choose the right colors based on the value of
" the background variable.  However, it is of limited use because this
" variable does not get properly set in the terminal.   

" Clear existing highlighting information.
hi clear
if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name="default"

" When the background is light, choose dark colors.
if &background == "light"
    highlight Normal            guifg=Black     guibg=White
    highlight Error             guifg=Black     guibg=Red

    highlight Comment           guifg=DarkRed   
    highlight Todo              guifg=Red                         gui=italic 

    highlight Constant          guifg=Black                       gui=italic
    highlight String            guifg=DarkGreen 
    highlight Number            guifg=Black     

    highlight Statement         guifg=DarkBlue                    gui=italic
    highlight Identifier        guifg=Black     
    highlight Function          guifg=Black     
    highlight Type              guifg=Black                       gui=italic

    highlight PreProc           guifg=Black                       gui=italic

    highlight Special           guifg=DarkGreen                   gui=italic
    highlight SpecialComment    guifg=DarkRed                     gui=italic

    highlight SpellBad          guisp=LightGray                   gui=undercurl
    highlight SpellCap          guisp=LightGray                   gui=none     
    highlight SpellRare         guisp=LightGray                   gui=undercurl
    highlight SpellLocal        guisp=LightGray                   gui=undercurl

    highlight DiffAdd           guibg=LightGreen                  gui=none
    highlight DiffChange        guibg=White                       gui=none
    highlight DiffDelete        guibg=LightBlue                   gui=none
    highlight DiffText          guibg=LightRed                    gui=none

    highlight Cursor            guifg=White      guibg=Black
    highlight LineNr            guifg=Black      guibg=LightGray
    highlight NonText           guifg=Black                       gui=bold

    highlight Visual                             guibg=LightGray  
    highlight Folded            guifg=Black      guibg=LightBlue 
    highlight MatchParen                         guibg=Gray 

" Likewise, choose light colors when the background is dark.
else
    highlight Normal            guifg=White      ctermfg=White      ctermbg=Black      guibg=Black
    highlight Error             guifg=White      ctermfg=White      ctermbg=Red        guibg=Red

    highlight Comment           guifg=Yellow     ctermfg=Yellow     cterm=none gui=italic 
    highlight Todo              guifg=LightGray  ctermfg=LightGray  cterm=none gui=none       

    highlight Constant          guifg=White      ctermfg=White      cterm=none gui=none       
    highlight String            guifg=Green      ctermfg=Green       
    highlight Number            guifg=White      ctermfg=White      cterm=none gui=none       

    highlight Statement         guifg=Blue       ctermfg=Blue       cterm=none gui=none       
    highlight Identifier        guifg=Yellow     ctermfg=Yellow     cterm=none gui=none       
    highlight Function          guifg=White      ctermfg=White      cterm=none gui=none       
    highlight Type              guifg=Cyan       ctermfg=Cyan       cterm=none gui=none       

    highlight PreProc           guifg=Blue       ctermfg=Blue       cterm=none gui=none       

    highlight Special           guifg=Green      ctermfg=Green      cterm=none gui=none       
    highlight SpecialComment    guifg=LightGray  ctermfg=LightGray  cterm=none gui=none       

    highlight SpellBad          guisp=DarkGray   ctermbg=DarkGray   gui=undercurl
    highlight SpellCap          guisp=DarkGray   ctermbg=DarkGray   gui=undercurl
    highlight SpellRare         guisp=DarkGray   ctermbg=DarkGray   gui=undercurl
    highlight SpellLocal        guisp=DarkGray   ctermbg=DarkGray   gui=undercurl

    highlight DiffAdd           guibg=LightGreen                    gui=none
    highlight DiffChange        guibg=White                         gui=none
    highlight DiffDelete        guibg=LightBlue                     gui=none
    highlight DiffText          guibg=LightRed                      gui=none

    highlight Cursor            guifg=Black                         guibg=White
    highlight LineNr            guifg=Black      ctermfg=Black      guibg=DarkGray   ctermbg=DarkGray
    highlight NonText           guifg=White                         gui=bold

    highlight Visual                                                guibg=DarkGray
    highlight Folded            guifg=Black      ctermfg=Black      guibg=DarkGray   ctermbg=DarkBlue
    highlight MatchParen                                            guibg=Gray 
endif

" Link the less common groups to the basic ones.
runtime shared.vim

