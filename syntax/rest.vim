" Restructured Text Syntax File
" =============================
" This is a minimal syntax highlighting file designed for the Restructured
" Text formatting language.  Most of it is derived from a more complete
" version done by Estienne Swart.  I removed all the features I don't use to
" make the highlighting more predictable (and good-looking).

" Check spelling by default in these files.
syntax spell toplevel

" Recognize a few of the inline constructs.  For the constructs that will
" frequently be used to hold variable names and file paths, turn off spell
" checking.
syntax region rstInline start="\*[^*]" end="\*" 
syntax region rstInline start="\*\*[^*]" end="\*\*" 
syntax region rstInline start="`[^`]" end="`" contains=@NoSpell
syntax region rstInline start="``" end="``" contains=@NoSpell

" Section headers will be spread over two lines.  I'm not very sophisticated
" with regular expressions, so I need to use a loop to ensure that the number
" of letters in the section name equals the number of underline characters.
for chars in range(3, 120)
    execute "syntax match rstSection " . printf("'.\\{%d}\\n[=]\\{%d}'", chars, chars)
    execute "syntax match rstSection " . printf("'.\\{%d}\\n[-]\\{%d}'", chars, chars)
endfor


" Highlight a variety of lists.  This was kept from the old file, so I can't
" be sure it actually works.  
syntax match rstList "^\s*\d\{1,3}\.\s"
syntax match rstList "^\s*\([+-]\|\*\)\s"
syntax match rstList ":[^:]\+:\s"me=e-1 contains=rstBibliographicField

" Link the syntax groups to some standard highlighting groups.  Right now,
" I've basically turned of highlighting by linking everything to the Normal
" group.
highlight def link rstSection           Normal
highlight def link rstInline            Normal
highlight def link rstList              Normal

" Let vim know which highlighting scheme is being used.
let b:current_syntax = "rst"
