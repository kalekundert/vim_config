" Highlight some special values.
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

" Match triple-quoted strings with backslashes after the third quote.
syntax region pythonString start="u\=r\='''\\" end="'''"
            \ contains=pythonEscape,pythonSpecialString,@Spell

syntax region pythonString start='u\=r\="""\\' end='"""'
            \ contains=pythonEscape,pythonSpecialString,@NoSpell

" Recognize some restructured text inside comments.
syntax region pythonVerbatim start="`" end="'" oneline
            \ transparent keepend contained contains=@NoSpell

" Match docstrings as comments, rather than strings.
syntax match pythonComment " *#.*" 
            \ contains=pythonVerbatim,pythonAcronym,@Spell
syntax region pythonComment start='"""{' end='}"""'
            \ keepend contains=@NoSpell
syntax region pythonComment start='""" ' end='"""$'
            \ keepend contains=pythonVerbatim,pythonAcronym,@Spell

" Recognize the magic comments that I tend to put in files.
syntax match pythonMagicComment "^# vim: .*$" contains=@NoSpell
syntax match pythonMagicComment "^# encoding: latin-1$" contains=@NoSpell
syntax match pythonMagicComment "^# encoding: utf-8$" contains=@NoSpell
syntax match pythonMagicComment "^#!/usr/bin/env python[23]\?$"
            \ contains=@NoSpell

" Highlight both the '@' sign and the function name for decorators.
syntax clear pythonDecorator
syntax match pythonDecorator " *@\h[a-zA-Z1-9_.]*"

" Don't hightlight the exception base class.
syntax keyword pythonExceptionBaseClass Exception

" Change how some groups are colored
highlight link pythonInclude Statement
highlight link pythonPreCondit Statement
highlight link pythonMagicComment SpecialComment

highlight link pythonConstant Constant 
highlight link pythonExceptions Normal
highlight link pythonDecorator PreProc

highlight link pythonEscape String
highlight link pythonSpecialString String
highlight link pythonExceptionBaseClass Normal

