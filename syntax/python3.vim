" Source the base python syntax files and use them unchanged.
runtime! syntax/python.vim

" Don't highlight the print, as it is no longer a keyword.
syntax keyword pythonPrint print
highlight link pythonPrint Normal
