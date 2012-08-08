" Highlight some special values
syntax keyword pythonConstant True False None

" Clear out the default string patterns.
syntax clear pythonString

" Don't spell check special characters within strings.
syntax match pythonSpecialString "%[^'" ]" contained
syntax match pythonSpecialString "\\." contained

" Include the quotes in the region matched by pythonString.
syntax region pythonString start='u\=r\="' skip='\\"' end='"' oneline
            \ contains=pythonEscape,pythonSpecialString,@Spell

" Only do spell checking in double-quoted strings.
syntax region pythonString start="u\=r\='" skip="\\'" end="'" oneline
            \ contains=pythonEscape,pythonSpecialString,@NoSpell

" Recognize some restructured text inside comments.
syntax region pythonVerbatim start="`" end="'" oneline
            \ keepend contained contains=@NoSpell

" Match docstrings as comments, rather than strings.
syntax match pythonComment " *#.*" contains=pythonVerbatim,@Spell
syntax region pythonComment start='"""{' end='}"""' keepend
syntax region pythonComment start='""" ' end='"""$'
            \ keepend contains=pythonVerbatim, @Spell

" Recognize magic comments that I tend to put in files.
syntax match pythonMagicComment "^#!/usr/bin/env python$" contains=@NoSpell
syntax match pythonMagicComment "^# vim: .*$" contains=@NoSpell
syntax match pythonMagicComment "^# encoding: latin-1$" contains=@NoSpell

" Include both the '@' sign and the function name in the decorator pattern.
syntax clear pythonDecorator
syntax match pythonDecorator "@\h[a-zA-Z1-9_.]*"

" Don't hightlight the exception base class.
syntax keyword pythonExceptionBaseClass Exception

" Change how some groups are colored
highlight link pythonInclude Statement
highlight link pythonPreCondit Statement

highlight link pythonConstant Constant 
highlight link pythonExceptions Constant
highlight link pythonDecorator PreProc

highlight link pythonVerbatim Comment
highlight link pythonMagicComment SpecialComment

highlight link pythonEscape String
highlight link pythonSpecialString String
highlight link pythonExceptionBaseClass Normal

