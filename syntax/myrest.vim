syn region restEmphasis start='\*' end='\*' keepend

Foo Bar
=======

syn match rest

" If you want to know how to match restructured test headers in vim, look no 
" further than this page:
"
"   http://briancarper.net/blog/448/
"
" The trick is the \= command.  This lets you embed arbitrary vim-script
" expressions in the search pattern, so I can assert that the number of
" punctuation characters is the same as the length of the title.

"syn region rstEmphasis start=+\*[^*]+ end=+\*+ 
"syn region rstStrongEmphasis start=+\*\*[^*]+ end=+\*\*+ 
"syn region rstInterpretedText start=+`[^`]+ end=+`+ contains=rstURL
"syn region rstInlineLiteral start="``" end="``" contains=rstURL

