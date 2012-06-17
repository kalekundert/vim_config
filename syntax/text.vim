" Lines that begin with special punctuation characters are taken to be code or
" shell demonstrations.  These lines will not be spell-checked.
syntax match textDemonstration '^\s\+[~#$>|] .*$' contains=@NoSpell
syntax match textDemonstration '^\s\+[/~:].*$' contains=@NoSpell

" Strings within single-quotes should not be spell-checked.
syntax region textVerbatim start="`" end="'" oneline contains=@NoSpell

" URLs (denoted by angle-brackets) should also not be spell checked.
syntax region textURL start="<" end=">" oneline contains=@NoSpell

highlight textDemonstration gui=italic cterm=bold term=bold

