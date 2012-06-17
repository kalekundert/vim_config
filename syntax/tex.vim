" Spell-check everywhere that does not match a syntax group.
syntax spell toplevel

syntax match latexCommand '\\[a-z]*' contains=@NoSpell
syntax match latexComment '^ *%.*$' contains=@Spell

syntax region latexArgument start="{" end="}" contains=@NoSpell
syntax region latexOptional start="\[" end="\]" contains=@NoSpell

" Linking the HTML groups to standard syntax groups.
highlight def link latexCommand Function
highlight def link latexArgument Function
highlight def link latexOptional Function

highlight def link latexComment Comment

let b:current_syntax = "latex"
