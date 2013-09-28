" Enable spell checking.
set spell

" Turn on automatic formatting.
set formatoptions+=a

" Use the structure of the code to create folds. 
set foldmethod=expr
set foldexpr=RestFoldExpression()
set foldtext=RestFoldText()

" RestFoldExpression {{{1
function! RestFoldExpression()

    let lines = {
    \       '-1' : getline(v:lnum - 1),
    \        '0' : getline(v:lnum),
    \        '1' : getline(v:lnum + 1),
    \        '2' : getline(v:lnum + 2) }

    let file_length = line('$')
    let screen_height = winheight(0)
    let file_length = 10
    let screen_height = 1

    let empty_line = '^\s*$'
    let title_line = '^[A-Z].*$'
    let single_underline = '^[- ]\+$'
    let double_underline = '^[= ]\+$'

    " If the file is short, don't fold anything.
    if file_length < screen_height
        return 0
    
    " Match the beginning of a table.
    elseif  
    \   (lines['-1'] =~ empty_line) &&
    \   (lines[ '0'] =~ double_underline) &&
    \   (lines[ '1'] =~ title_line) &&
    \   (lines[ '2'] =~ double_underline)

        return 'a1'

    " Match the beginning of a major section.
    elseif
    \   (lines['-1'] =~ empty_line) &&
    \   (lines[ '0'] =~ title_line) &&
    \   (lines[ '1'] =~ double_underline)

        return '>1'

    " Match the beginning of a minor section.
    elseif
    \   (lines['-1'] =~ empty_line) &&
    \   (lines[ '0'] =~ title_line) &&
    \   (lines[ '1'] =~ single_underline)

        return '>2'

    " Match the end of a table.
    elseif
    \   (lines[ '0'] =~ double_underline) &&
    \   (lines[ '1'] =~ empty_line)

        return 's1'

    " Otherwise maintain the current fold level.
    else
        return '='

    endif

endfunction

" RestFoldText {{{1
function! RestFoldText()

    let text = getline(v:foldstart)
    let offset = 0

    " Find the line with the title.
    while text =~ '^[= ]\+$'
        let offset += 1
        let text = getline(v:foldstart + offset)
    endwhile

    let text = substitute(text, '  .*$', '', '')

    let lines = 1 + v:foldend - v:foldstart
    let lines = ' (' . lines . ') '

    let cutoff = &columns - strlen(lines)
    
    " Truncate long titles.
    if strlen(text) >= cutoff
        let text = text[0:cutoff - 4] . '...'
        let padding = ''
    else
        let padding = cutoff - strlen(text) - 1
        let padding = ' ' . repeat('-', padding)
    endif

    return text . padding . lines

endfunction

" }}}1
