if exists('did_load_filetypes')
    finish
endif

augroup filetypedetect
    autocmd BufRead,BufNewFile *.sh     setfiletype zsh
    autocmd BufRead,BufNewFile *.pym    setfiletype python
    autocmd BufRead,BufNewFile *.pml    setfiletype pymol
    autocmd BufRead,BufNewFile *.txt    setfiletype text
    autocmd BufRead,BufNewFile *.rst    setfiletype rest
    autocmd BufRead,BufNewFile *.tex    setfiletype tex
    autocmd BufRead,BufNewFile *.mdp    setfiletype mdp
    autocmd BufRead,BufNewFile *.html,*.xml     setfiletype sgml
    autocmd BufRead,BufNewFile directory.txt,*.notes    setfiletype directory
augroup end

