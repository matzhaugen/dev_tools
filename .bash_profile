export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PS1="\w 🌞 > "
export PATH="/users/matzhaugen/vise/tools:$PATH"
export PATH="$PATH:/Users/matzhaugen/go/bin"
export LANG=en_US.UTF-8
export PYENV_ROOT="$HOME/.pyenv"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

alias jn="jupyter notebook"
alias sb="source ~/.bash_profile"
alias eb="subl ~/.bash_profile"
alias g="git $@"
alias gs="git status"
alias gb="git branch --sort=-committerdate"
alias gc="git checkout $@"
alias gd="git diff"
alias grh="git reset --hard"
alias gcm="git checkout master"
alias k="kubectl $@"
alias d="docker $@"

transgit () {
	git stash && git checkout master && git pull && git checkout -b $1 && git stash pop
}

awscp () {
	aws s3 cp $1 .
}
lg () {
	git add -u .
	git commit -m "$1"
	git push
}

lgq () {  # Do not push
	git add -u .
	git commit -m "$1"
}

amendgit () {
	git add -u .
	git commit --amend --no-edit
	git push -f
}


mwm () {
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	git stash && git checkout master && git pull && git checkout $current_branch && git merge master
}

eval "$(/usr/local/bin/brew shellenv)"
eval "$(pyenv init -)"

# Allow multiple git keys
eval "$(ssh-agent -s)"


source ~/.vise_bash_profile
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

