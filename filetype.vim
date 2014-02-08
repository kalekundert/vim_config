if exists('did_load_filetypes')
    finish
endif

augroup filetypedetect
    autocmd BufRead,BufNewFile CMakeLists.txt setfiletype cmake
    autocmd BufRead,BufNewFile *.sh           setfiletype zsh
    autocmd BufRead,BufNewFile *.pml          setfiletype pymol
    autocmd BufRead,BufNewFile *.txt          setfiletype text
    autocmd BufRead,BufNewFile *.rst          setfiletype rest
    autocmd BufRead,BufNewFile *.tex          setfiletype tex
    autocmd BufRead,BufNewFile *.lit          setfiletype literature
    autocmd BufRead,BufNewFile *.dox          setfiletype conf
    autocmd BufRead,BufNewFile *.mdp          setfiletype mdp
    autocmd BufRead,BufNewFile *.xml          setfiletype sgml
    autocmd BufRead,BufNewFile *.html         setfiletype sgml
    autocmd BufRead,BufNewFile *.mutt         setfiletype muttrc

    autocmd BufRead,BufNewFile *.py,*.pyw,*.pym,Scons*
            \ if getline(1) =~ 'python3' | 
            \   setfiletype python3 |
            \ else |
            \   setfiletype python2 |
            \ endif
augroup end

