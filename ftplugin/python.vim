" Things to Do
" ============
" 1. Handle long function names.  Long names need to be truncated, otherwise
"    they push the line count off the screen.  Furthermore, sometimes I break
"    the argument list onto multiple lines.  This could possibly confuse the
"    foldtext function.
"
" 2. Add support for custom fold markers.  I haven't thought about it much, but
"    I like the idea of marking folds using multpile pound signs.  In other
"    words, '### .*' indicates the start of a level three fold.

" Use the structure of the code to create folds. 
setlocal foldmethod=expr
setlocal foldexpr=PythonFoldExpression()
setlocal foldtext=PythonFoldText()

" Enable spell checking
set spell

function! PythonFoldExpression()

    let line = getline(v:lnum)
    let indent = indent(v:lnum)
    let fold_level = indent / &shiftwidth + 1

    let blank_pattern = '^\s*$'
    let fold_pattern = '^\s*\(class\s\|def\s\|@\)'

    " Don't automatically nest more than two levels of folds.  This helps avoid
    " situations that confuse the algorithm, like functions inside loops.

    if fold_level > 2
        return '='
    endif

    " Each class and function starts a new fold, unless the previous line also
    " defined a class or function.  The fold level is based on the indentation
    " level of that class or function.

    let previous_line = getline(v:lnum - 1)

    if line =~ fold_pattern
        if previous_line =~ fold_pattern
            return '='
        else
            return '>' . fold_level
        endif
    endif

    " Consecutive blank lines decrease the fold level by 1.  This makes it
    " possible to separate the folds into groups.
    
    let next_line = getline(v:lnum + 1)

    if (line =~ blank_pattern) && (next_line =~ blank_pattern)
        return 's1'
    endif

    " If this line is not indented at all, or if it's an empty line and the
    " next non-empty line isn't indented, then the fold level can be set to
    " zero.  This is convenient for small helper functions.

    if (indent == 0) && (line !~ blank_pattern) 
        return 0
    endif

    let next_nonblank_lnum = nextnonblank(v:lnum)
    let next_nonblank_indent = indent(next_nonblank_lnum)

    if (line =~ blank_pattern) && (next_line !~ fold_pattern) &&
                \ (next_nonblank_indent == 0)
        return 0
    endif

    " If none of the above criteria were met, keep the fold level the same as
    " it was on the previous line.  See `:help fold-expr' for the meaning of
    " the return strings.

    return '='

endfunction

function! PythonFoldText()

    " Label each fold with the first line of text within that fold and the
    " number of lines contained by the fold.

    let text = getline(v:foldstart)
    let offset = 0

    while text =~ '^\s*@'
        " Don't show decorators.
        let offset += 1
        let text = getline(v:foldstart + offset)
    endwhile

    let text = substitute(text, ':\s*$', '', '')
    let text = substitute(text, '#.*$', '', '')

    if text =~ '^\s*class\>'
        " Don't show parent classes.
        let text = substitute(text, '\s*(.*)', '', '')
    endif

    let lines = 1 + v:foldend - v:foldstart
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
