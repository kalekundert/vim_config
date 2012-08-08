if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd BufRead,BufNewFile *.sh     setfiletype zsh
    autocmd BufRead,BufNewFile *.pym    setfiletype python

    autocmd BufRead,BufNewFile directory.txt,*.notes    setfiletype directory

    autocmd BufRead,BufNewFile *.txt    setfiletype text
    autocmd BufRead,BufNewFile *.tex    setfiletype tex

    autocmd BufRead,BufNewFile *.mdp    setfiletype mdp

    autocmd BufRead,BufNewFile *.html,*.xml     setfiletype sgml
augroup end

