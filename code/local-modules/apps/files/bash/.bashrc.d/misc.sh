alias cdl='cl ~/learn'
alias cds='cl ~/work/sophomore1'

alias gcc='gcc -W -Wall'
alias g++='g++ -W -Wall'
alias e='emacsclient -t -a emacs'

alias looplay='mplayer -loop 0'

csb() {
    rm cscope.{files,out}
    find $(pwd) -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.hpp' > cscope.files
    #cscope -i cscope.files -b
    cscope -b
}

alias panlatex="pandoc --template=$HOME/snippets/tex/pandoc.tex --latex-engine=xelatex -t latex"

mkd2latex() {
    panlatex -f markdown -o ${1%.*}.pdf $@
}

mkd2html() {
    pandoc -s -f markdown -t html --latexmathml -o ${1%.*}.html $@
}

mkd2reveal() {
    pandoc --template=/home/charlie/snippets/pandoc-templates/default.revealjs -t revealjs -o ${1%.*}.html $@
}

panrst2html() {
    if [[ $# -ne 1 ]]; then
        echo "need input name"
        return 1
    fi
    pandoc -s -f rst -t html -o ${1%.*}.html $1
}

alias mnt='udevil mount $@'
alias umnt='udevil umount $@'
