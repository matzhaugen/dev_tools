export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PS1="\w 🌞 > "
export PATH="/users/matzhaugen/vise/tools:$PATH"
export PATH="$PATH:/Users/matzhaugen/go/bin"
export PYTHONPATH="$PYTHONPATH:/Users/matzhaugen/vise/python"
export PYENV_ROOT="$HOME/.pyenv"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

alias sb="source ~/.bash_profile"
alias eb="subl ~/.bash_profile"
alias g="git $@"
alias gs="git status"
alias gb="git branch"
alias gc="git checkout $1"
alias gd="git diff"
alias grh="git reset --hard"
alias k="kubectl $@"

awscp () {
	aws s3 cp $1 .
}
lg () {
	git add -u .
	git commit -m "$1"
	git push
}
get_s3_req () {
	aws s3 cp "s3://vise3-pce-logging/$1/optimization_request_${2:-DEFAULT}.pb" .
}

ls_s3_req () {
	aws s3 ls s3://vise3-pce-logging/$1/
}


mwm () {
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	git stash && git checkout master && git pull && git checkout $current_branch && git merge master
}

eval "$(/usr/local/bin/brew shellenv)"
eval "$(pyenv init -)"


source ~/.vise_bash_profile