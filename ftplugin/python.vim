" Enable spell checking:
set spell

" Change the auto-formatting options:
set formatoptions-=t

" Define macros for a few common code snippets:
imap <F5> #!/usr/bin/env python<CR><CR>
imap <F6> import argparse<CR><CR>
         \parser = argparse.ArgumentParser()<CR>
         \parser.add_argument()<CR>
         \arguments = parser.parse_args()<CR>
imap <F7> if __name__ == '__main__':<CR>    pass<CR>
imap <F8> from __future__ import division<CR>

" Use the structure of the code to create folds: 
setlocal foldmethod=expr
setlocal foldexpr=PythonFoldExpressionCaller()
setlocal foldtext=PythonFoldTextCaller()

function! PythonFoldExpression(lnum)    " {{{1

    let line = getline(a:lnum)
    let indent = indent(a:lnum)
    let fold_level = indent / &shiftwidth + 1

    let blank_pattern = '^\s*$'
    let fold_pattern = '^\s*\(class\s\|def\s\|@\|if __name__\)'

    " Don't automatically nest more than two levels of folds.  This helps both
    " to speed up the script and to avoid situations that confuse the
    " algorithm, like functions inside loops.

    if fold_level > 2
        return '='
    endif

    " Respect manual fold markers.  The markers recognized by this script have
    " the same format as the markers that vim recognizes by default, namely
    " `{{{n' and `}}}n', except only one-digit numbers are allowed.

    let start_pattern = '{{{\d\+'
    let end_pattern = '}}}d\+'

    if line =~ start_pattern
        let index = match(line, start_pattern) + 3
        return '>' . line[index]
    endif

    if line =~ end_pattern
        let index = match(line, end_pattern) + 3
        return '<' . line[index]
    endif

    " Each class and function starts a new fold, unless the previous line also
    " defined a class or function.  The fold level is based on the indentation
    " level of that class or function.

    let previous_line = getline(a:lnum - 1)

    if line =~ fold_pattern
        if previous_line =~ fold_pattern
            return '='
        else
            return '>' . fold_level
        endif
    endif

    " Consecutive blank lines decrease the fold level by 1.  This makes it
    " possible to separate the folds into groups.
    
    let next_line = getline(a:lnum + 1)

    if (line =~ blank_pattern) && (next_line =~ blank_pattern)
        return 's1'
    endif

    " If none of the above criteria were met, keep the fold level the same as
    " it was on the previous line.  See `:help fold-expr' for the meaning of
    " the return strings.

    return '='

endfunction

function! PythonFoldText(foldstart, foldend)    " {{{1

    " Label each fold with the first line of text within that fold and the
    " number of lines contained by the fold.

    let text = getline(a:foldstart)
    let offset = 0

    while text =~ '^\s*@'
        " Don't show decorators.
        let offset += 1
        let text = getline(a:foldstart + offset)
    endwhile

    let text = substitute(text, ':\s*$', '', '')
    "let text = substitute(text, '#.*$', '', '')

    if text =~ '^\s*class\>'
        " Don't show parent classes.
        let text = substitute(text, '\s*(.*)', '', '')
    endif

    let lines = 1 + a:foldend - a:foldstart
    let lines = ' (' . lines . ')'

    let cutoff = &columns - strlen(lines)
    
    if strlen(text) >= cutoff
        " Truncate long function names.
        let text = text[0:cutoff - 4] . '...'
        let padding = ''
    else
        " Otherwise fill extra space with dashes.
        let padding = cutoff - strlen(text) - 1
        let padding = ' ' . repeat(' ', padding)
    endif

    return text . padding . lines

endfunction

function! PythonFoldExpressionCaller()  " {{{1
    return PythonFoldExpression(v:lnum)
endfunction

function! PythonFoldTextCaller()    " {{{1
    return PythonFoldText(v:foldstart, v:foldend)
endfunction     " }}}1
