" Use tabs instead of spaces and set the tabstop to 2.
set tabstop=2
set softtabstop=0
set shiftwidth=2
set noexpandtab

" Enable sophisticated text editing within comments.
set spell
set formatoptions+=a

" Use the structure of the code to create folds.
set foldmethod=expr
set foldexpr=CppFoldExpressionCaller()
set foldtext=CppFoldTextCaller()

function! CppFoldExpression(lnum)  " {{{1

    let line = getline(a:lnum)
    let marker_start_pattern = '{{{\d$'
    let marker_end_pattern = '}}}\d$'

    " Respect manual fold markers.  The regular triple-bracket markers are 
    " respected, although the fold number is always taken to be 1.

    if line =~ marker_start_pattern
        return '>1'
    endif

    if line =~ marker_end_pattern
        return '<1'
    endif

    " If none of the above criteria were met, keep the fold level the same as
    " it was on the previous line.  See `:help fold-expr' for the meaning of
    " the return strings.

    return '='

endfunction

function! CppFoldText(foldstart, foldend)    " {{{1

    " Search for a line that contains the namespace operator '::' within the first 
    " few lines of the fold.  If such a line is found, use it to display the 
    " fold.  Otherwise, use the first line.

    let line_counter = a:foldstart
    let lines_searched = 0

    while 1
        let line = getline(line_counter)
        let line_counter += 1
        let lines_searched += 1

        " Skip doxygen comments
        if line =~ '^\s*\/\/\/' || line =~ '@'
            continue
        endif

        " Skip blank start markers
        if line =~ '^\s*\/\/ {{{'
            continue
        endif

        " If a comment is found, use it to name the fold.
        if line =~ '\/\/'
            break
        endif

        " If a function name is found, use it to name the fold.
        if line =~ '\<\w\+\>::'
            break
        endif

        " Give up after three lines.
        if line_counter > a:foldend
            let line = getline(a:foldstart)
            break
        endif

    endwhile

    " Break the line into two parts: a title and a set of flags.  The title 
    " will be left-justified, while the flags will be concatenated together and 
    " right-justified.

    let title = line
    let flags = []

    " Format a succinct fold message.  The title is stripped of whitespace and 
    " truncated, if it is too long to fit on the screen.  The total number of 
    " folded lines are added as an extra tag, and all the flags are wrapped in 
    " parenthesis.

    let flags = add(flags, 1 + a:foldend - a:foldstart)
    let status = ' (' . join(flags, ') (') . ')'

    let cutoff = &columns - strlen(status)
    let title = substitute(title, '\t', '  ', 'g')
    let title = substitute(title, '^\(.\{-}\)\s*\(/*\s*{{{\d\)\=\s*$', '\1', '') " }}}
    
    if strlen(title) >= cutoff
        let title = title[0:cutoff - 4] . '...'
        let padding = ''
    else
        let padding = cutoff - strlen(title) - 1
        let padding = ' ' . repeat(' ', padding)
    endif

    return title . padding . status

endfunction

function! CppFoldExpressionCaller()  " {{{1
    return CppFoldExpression(v:lnum)
endfunction

function! CppFoldTextCaller()    " {{{1
    return CppFoldText(v:foldstart, v:foldend)
endfunction     " }}}1
