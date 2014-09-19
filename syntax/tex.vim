" Spell-check everywhere that does not match a syntax group.
syntax spell toplevel

syntax match latexCommand '\\[a-z*]*' contains=@NoSpell
syntax match latexPercent '\\%'
syntax match latexComment '%.*$' contains=@Spell,@latexSpellExceptions

syntax region latexArgument start="{" end="}" contains=@NoSpell,latexArgument
syntax region latexOptional start="\[" end="\]" contains=@NoSpell

" Don't spell-check email addresses in comments.
syn match latexEmailAddress "[a-zA-Z0-9.-]\+@[a-zA-Z0-9.-]\+" 
            \ contains=@NoSpell contained transparent
syn cluster latexSpellExceptions add=latexEmailAddress

" Don't spell-check URLs in comments.
syn region latexHyperlink start="<" end=">"
            \ contains=@NoSpell contained transparent excludenl
syn cluster latexSpellExceptions add=latexHyperlink

" Don't spell-check preformatted text in comments.
syn region latexHyperlink start="`" end="'"
            \ contains=@NoSpell contained transparent excludenl
syn cluster latexSpellExceptions add=latexHyperlink

" Linking the HTML groups to standard syntax groups.
highlight def link latexCommand Function
highlight def link latexArgument Function
highlight def link latexOptional Function
highlight def link latexComment Comment

let b:current_syntax = "latex"
