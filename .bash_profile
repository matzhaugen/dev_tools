export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PS1="\w 🌞 > "
export PATH="/users/matzhaugen/vise/tools:$PATH"
export PATH="$PATH:/Users/mhaugen/go/bin"
export LANG=en_US.UTF-8
export PYENV_ROOT="$HOME/.pyenv"
export OMP_NUM_THREADS=2

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

alias jn="jupyter notebook"
alias sb="source ~/.bash_profile"
alias eb="subl ~/.bash_profile"
alias evb="subl ~/.vise_bash_profile"
alias g="git $@"
alias gs="git status"
alias gb="git branch --sort=-committerdate"
alias gc="git checkout $@"
alias gd="git diff"
alias grh="git reset --hard"
alias gcm="git checkout master"
alias k="kubectl $@"
alias d="docker $@"
alias dl="docker logs -f $@"
alias de="docker exec -it $@ bash"

transgit () {
	git stash && git checkout master && git pull && git checkout -b $1 && git stash pop
}

awscp () {
	aws s3 cp $1 .
}
lg () {
	# git diff --name-only | xargs pre-commit run --files
	git add -u
	git commit -m "$1"
	git push
}

lgq () {  # Do not push
	git add -u
	git commit -m "$1"
}

amendgit () {
	git add -u
	git commit --amend --no-edit
	git push -f
}

# example: eternal-port-forward internal service/market-data 5001:5001
# ref: https://stackoverflow.com/questions/47484312/kubectl-port-forwarding-timeout-issue
eternal-port-forward () {
    while true; do kubectl --namespace $1 port-forward $2 $3; done
}

delete_old () {
    for k in $(git branch | sed /\*/d); do 
        echo $k
        if [ -z "$(git log -1 --since='3 weeks ago' -s $k)" ]
        then
            git branch -D $k
            echo "Deleting $k"
        fi
    done
}

mwm () {
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	git stash && git checkout master && git pull && git checkout $current_branch && git merge master
}


# Allow multiple git keys
eval "$(ssh-agent -s)"


source ~/.vise_bash_profile
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true


eval "$(/opt/homebrew/bin/brew shellenv)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
