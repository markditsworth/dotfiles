# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH:/usr/local/go/bin"
export PATH
export EDITOR=/usr/bin/vim
export GOPATH=~/go
export GOROOT=/usr/local/go
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias jn="jupyter-notebook"


function pdf-resize () {
    input=$1
    output=$2
    if [ -z "$output" ]; then
        output="${input}_resized.pdf"
    fi
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -sOutputFile=${output} ${input}
}

function git-squash () {
	branch=$1
	git checkout $branch
	git reset $(git merge-base master $branch)
	git add -A
}

function init () {
	path=/home/markd/Projects/
	folder=$1
	lang=$(echo $2 | sed 's/-//g')
	if [ "${lang}" == 'python' ]
	then
		mkdir -p ${path}${folder}/tests
		touch ${path}${folder}/Makefile
		touch ${path}${folder}/.gitignore
		echo __pycache__/ >> ${path}${folder}/.gitignore
		echo .pytest_cache/ >> ${path}${folder}/.gitignore
		echo *.pyc >> ${path}${folder}/.gitignore
		echo *.pyi >> ${path}${folder}/.gitignore
		echo venv/ >> ${path}${folder}/.gitignore
		cd ${path}${folder}
	elif [ "${lang}" == "c" ]
	then
		mkdir -p ${path}${folder}/include
		cd ${path}${folder}
		mkdir src
		touch src/main.c
		touch Makefile
		echo IDIR=include >> Makefile
		echo ODIR=obj >> Makefile
		echo CC=gcc >> Makefile
		echo 'CFLAGS=-I$(IDIR)' >> Makefile
		touch .gitignore
		echo *.so >> .gitignore
		echo *.gch >> .gitignore
		echo *.o >> .gitignore
		echo *.out >> .gitignore
		echo *.exe >> .gitignore
		echo *.log >> .gitignore
		echo *.sh >> .gitignore
	elif [ "${lang}" == 'go' ]
	then
		mkdir -p ${path}${folder}/src
		cd ${path}${folder}
		mkdir tests
		touch src/main.go
		touch Makefile
		echo ".PHONY: fmt" >> Makefile
		echo "fmt:" >> Makefile
		echo -e "\tgofmt -w src/*.go" >> Makefile
		echo "" >> Makefile
		echo ".PHONY: unit-test" >> Makefile
		echo "unit-test: fmt" >> Makefile
		echo -e "\tgo test -v tests/" >> Makefile
		echo "" >> Makefile
		echo ".PHONY: build" >> Makefile
		echo "build:" >> Makefile
		echo -e "\tgo build src/main.go" >> Makefile

	else
		echo "${lang} not supported yet"
	fi
}
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/markd/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/markd/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/markd/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/markd/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
