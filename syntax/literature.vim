syntax clear
syntax sync minlines=5

syntax match litTopRule     "^=\{79}$\n" nextgroup=litTitle
syntax match litTitle       "^\a.*$\n" nextgroup=litTitle,litMidRule contains=@NoSpell
syntax match litMidRule     "^-\{79}$\n" nextgroup=litAuthor
syntax match litAuthor      "^\a.*$\n" nextgroup=litAuthor contains=@NoSpell

syntax match litNormal      "^[^=-].*$" contains=litLatin,litAcronym,litVerbatim
syntax match litSection     "^\a*:$"

syntax match litLatin       "[dD]e[ \n]novo" contained contains=@NoSpell
syntax match litLatin       "[iI]n[ \n]vivo" contained contains=@NoSpell
syntax match litLatin       "[iI]n[ \n]vitro" contained contains=@NoSpell
syntax match litLatin       "[iI]n[ \n]silico" contained contains=@NoSpell

syntax match litLatin       "E\.[ \n]\+coli" contained contains=@NoSpell
syntax match litLatin       "S\.[ \n]\+cerevisiae" contained contains=@NoSpell
syntax match litLatin       "C\.[ \n]\+elegans" contained contains=@NoSpell
syntax match litLatin       "D\.[ \n]\+melanogaster" contained contains=@NoSpell

syntax match litLatin       "M\.[ \n]\+tuberculosis" contained contains=@NoSpell
syntax match litLatin       "T\.[ \n]\+cruzi" contained contains=@NoSpell
syntax match litLatin       "L\.[ \n]\+major" contained contains=@NoSpell
syntax match litLatin       "S\.[ \n]\+mansoni" contained contains=@NoSpell
syntax match litLatin       "S\.[ \n]\+japonicum" contained contains=@NoSpell
syntax match litLatin       "S\.[ \n]\+ha\?ematobium" contained contains=@NoSpell

syntax match litAcronym     "\w*\u\w*\u\w*" contained contains=@NoSpell

syntax region litVerbatim start="`" end="'" oneline contains=@NoSpell
syntax region litVerbatim start="<" end=">" oneline contains=@NoSpell

highlight litTitle      gui=bold      cterm=bold term=bold
highlight litSection    gui=underline cterm=bold term=bold
highlight litLatin      gui=italic    cterm=none term=none




