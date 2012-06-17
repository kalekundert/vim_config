syntax clear
syntax sync minlines=5

syntax match dirTopRule     "^=\{79}$\n" nextgroup=dirTitle
syntax match dirTitle       "^\a.*$\n" nextgroup=dirTitle,dirMidRule contains=@NoSpell
syntax match dirMidRule     "^-\{79}$\n" nextgroup=dirAuthor
syntax match dirAuthor      "^\a.*$\n" nextgroup=dirAuthor contains=@NoSpell

syntax match dirNormal      "^[^=-].*$" contains=dirLatin,dirAcronym,dirVerbatim

syntax match dirSection     "^Notes:"
syntax match dirSection     "^Categories:"
syntax match dirSection     "^Priority:"
syntax match dirSection     "^Bibliography:"
syntax match dirSection     "^Abstract:"
syntax match dirSection     "^Background:"
syntax match dirSection     "^Methods:"
syntax match dirSection     "^Results:"
syntax match dirSection     "^Discussion:"
syntax match dirSection     "^Passages:"
syntax match dirSection     "^Full Text:"
syntax match dirSection     "^Definitions:"
syntax match dirSection     "^References:"
syntax match dirSection     "^Warnings:"

syntax match dirLatin       "[dD]e[ \n]novo" contained contains=@NoSpell
syntax match dirLatin       "[iI]n[ \n]vivo" contained contains=@NoSpell
syntax match dirLatin       "[iI]n[ \n]vitro" contained contains=@NoSpell
syntax match dirLatin       "[iI]n[ \n]silico" contained contains=@NoSpell

syntax match dirLatin       "E\.[ \n]\+coli" contained contains=@NoSpell
syntax match dirLatin       "S\.[ \n]\+cerevisiae" contained contains=@NoSpell
syntax match dirLatin       "C\.[ \n]\+elegans" contained contains=@NoSpell
syntax match dirLatin       "D\.[ \n]\+melanogaster" contained contains=@NoSpell

syntax match dirLatin       "M\.[ \n]\+tuberculosis" contained contains=@NoSpell
syntax match dirLatin       "T\.[ \n]\+cruzi" contained contains=@NoSpell
syntax match dirLatin       "L\.[ \n]\+major" contained contains=@NoSpell
syntax match dirLatin       "S\.[ \n]\+mansoni" contained contains=@NoSpell
syntax match dirLatin       "S\.[ \n]\+japonicum" contained contains=@NoSpell
syntax match dirLatin       "S\.[ \n]\+ha\?ematobium" contained contains=@NoSpell

syntax match dirAcronym     "[A-Z0-9]\{2,}" contained contains=@NoSpell

syntax region dirVerbatim start="`" end="'" oneline contains=@NoSpell
syntax region dirVerbatim start="<" end=">" oneline contains=@NoSpell

highlight dirTitle      gui=bold      cterm=bold term=bold
highlight dirSection    gui=underline cterm=bold term=bold
highlight dirLatin      gui=italic    cterm=none term=none




