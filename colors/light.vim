" Introduction
" ============
" This is a light-background syntax highlighting scheme that primarily uses
" font to distinguish between different syntax groups.  The differences in
" color are fairly subtle.  This file only supports the graphical version of
" vim, because my color terminal isn't capable of rendering all the necessary
" fonts.

" Clear existing highlighting information.
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="default"

" Defining the basic highlighting groups
highlight Normal            guifg=Black     guibg=White
highlight Error	            guifg=Black     guibg=Red

highlight Comment           guifg=DarkRed   
highlight Todo	            guifg=DarkRed   guibg=White      gui=italic 

highlight Constant          guifg=Black                      gui=italic
highlight String            guifg=DarkGreen 
highlight Number            guifg=Black     

highlight Statement         guifg=DarkBlue                   gui=italic
highlight Identifier	    guifg=Black     
highlight Function          guifg=Black     
highlight Type              guifg=Black                      gui=italic

highlight PreProc           guifg=DarkBlue  

highlight Special           guifg=DarkGreen                  gui=italic
highlight SpecialComment    guifg=DarkRed                    gui=italic

highlight SpellBad          guisp=LightGray                  gui=undercurl
highlight SpellCap          guisp=LightGray                  gui=undercurl
highlight SpellRare         guisp=LightGray                  gui=undercurl
highlight SpellLocal        guisp=LightGray                  gui=undercurl

highlight DiffAdd           guibg=LightGreen                 gui=none
highlight DiffChange        guibg=White                      gui=none
highlight DiffDelete        guibg=LightBlue                  gui=none
highlight DiffText          guibg=LightRed                   gui=none

highlight Cursor            guifg=White      guibg=Black
highlight LineNr            guifg=Black      guibg=LightGray
highlight NonText           guifg=Black                      gui=bold

highlight Visual                             guibg=LightGray
highlight Folded            guifg=Black      guibg=LightBlue 
highlight MatchParen	                     guibg=Gray 

" Linking less common groups to the basic ones
runtime shared.vim

