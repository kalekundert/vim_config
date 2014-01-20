" Enable spell checking:
set spell
set spellcapcheck=""

" Change the auto-formatting options:
set formatoptions+=a
set formatoptions-=t

" Make tabs clearly visible:
set list listchars=tab:→\ 

" Define macros for a few common code snippets:
imap <F5> #!/usr/bin/env python<CR><CR>
imap <F6> import argparse<CR><CR>
         \parser = argparse.ArgumentParser()<CR>
         \parser.add_argument()<CR>
         \arguments = parser.parse_args()<CR>
imap <F7> if __name__ == '__main__':<CR>    pass<CR>
imap <F8> from __future__ import division<CR>

" Use the structure of the code to create folds: 
set foldmethod=expr
set foldexpr=PythonFoldExpressionCaller()
set foldtext=PythonFoldTextCaller()

function! PythonFoldExpression(lnum)    " {{{1
    let line = getline(a:lnum)
    let indent = indent(a:lnum)
    let fold_level = indent / &shiftwidth + 1

    let blank_pattern = '^\s*$'
    let manual_pattern = '# .*(fold)'
    let ignore_pattern = '# .*(no fold)'
    let fold_pattern = '^\s*\(class\s\|def\s\|@\|if __name__\s\)'
    let doc_open_pattern = '^\s*""" $'
    let doc_close_pattern = '^\s*"""$'

    " Don't automatically nest more than two levels of folds.  This helps both
    " to speed up the script and to avoid situations that confuse the
    " algorithm, like functions inside loops.

    if fold_level > 2
        return '='
    endif

    " Respect manual fold markers.  Any line that contains both a hash and the 
    " string '(fold)' will be taken as the start of a fold.  The fold level 
    " will be taken from the indentation of that line.

    if line =~ manual_pattern
        return '>' . fold_level
    endif

    " Don't start new folds on lines that contain the string '(no fold').

    if line =~ ignore_pattern
        return '='
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

    " Recognize docstrings that begin and end with three double quotes all 
    " alone on a line.  This is in accordance with the numpy documentation.

    if line =~ doc_open_pattern
        return '>' . fold_level
    endif

    if line =~ doc_close_pattern
        return '<' . fold_level
    endif

    " If none of the above criteria were met, keep the fold level the same as
    " it was on the previous line.  See `:help fold-expr' for the meaning of
    " the return strings.

    return '='

endfunction

function! PythonFoldText(foldstart, foldend)    " {{{1

    " Find the line that should be used to summarize the fold.  This is usually 
    " the first line, but decorators are explicitly skipped.

    let line = getline(a:foldstart)
    let offset = 0

    while line =~ '^\s*@' || line =~ '^\s*"""'
        let offset += 1
        let line = getline(a:foldstart + offset)
    endwhile

    " Break the line into two parts: a title and a set of flags.  The title 
    " will be left-justified, while the flags will be concatenated together and 
    " right-justified.

    let comment_pattern = '# .*(fold)'
    let code_pattern = '^\s*\(class\s\|def\s\|if __name__\s\)'

    if line =~ comment_pattern
        let index = stridx(line, '(fold)') - 1
        let title = substitute(line[0:index], '^\(.\{-}\)#\s*$', '\1', '')
        let flags = []

    elseif line =~ code_pattern
        let fields = split(line, '#')

        " Tags are taken to be parenthetical phrases found within an inline
        " comment.  Line that don't have an inline comment can be trivially 
        " processed, so this case is handled specially.

        if len(fields) == 1
            let title = line
            let flags = []
        else
            let title = fields[0]
            let flags = matchlist(fields[1], '(\([^)]\+\))')
            let flags = filter(flags[1:], 'v:val != ""')
        endif

    else
        let title = line
        let flags = []

    endif

    " Format a succinct fold message.  The title is stripped of whitespace and 
    " truncated, if it is too long to fit on the screen.  The total number of 
    " folded lines are added as an extra tag, and all the flags are wrapped in 
    " parenthesis.

    let flags = add(flags, 1 + a:foldend - a:foldstart)
    let status = '(' . join(flags, ') (') . ')'

    let cutoff = &columns - strlen(status)
    let title = substitute(title, '^\(.\{-}\)\s*$', '\1', '')
    
    if strlen(title) > cutoff
        let title = title[0:cutoff - 4] . '...'
        let padding = ''
    else
        let padding = cutoff - strlen(title) - 1
        let padding = ' ' . repeat(' ', padding)
    endif

    return title . padding . status

endfunction

function! PythonFoldExpressionCaller()  " {{{1
    return PythonFoldExpression(v:lnum)
endfunction

function! PythonFoldTextCaller()    " {{{1
    return PythonFoldText(v:foldstart, v:foldend)
endfunction     " }}}1
