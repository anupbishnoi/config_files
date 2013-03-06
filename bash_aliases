# some bash aliases
alias ll="ls -hlaoptAFG"
alias la="ls -ptAFG"
alias ls="ls -ptFG"
alias als="vim ~/.bash_aliases; . ~/.bash_aliases"
alias tree="tree -I node_modules"
alias noex="chmod -x *.*"
alias whereis="find . | grep -i"

# GTD tools
alias ijust="echo >> ~/ijust"
alias about="cat ijust | grep -i"
alias t="todo.sh"

# coding tools
alias jsdocs="rocco -l js"
# jsdocs -o output/ file.js
alias serve="python -m SimpleHTTPServer"

# npm
alias ns="npm start"
alias nt="npm test"

# git aliases
alias gst="git status"
alias gd="git diff"
alias gdlast="git diff --cached HEAD^"

alias gb="git branch"
alias gbd="git branch -D"
alias gba="git branch -a"
alias gbr="git branch -m"  # rename a branch

alias ga="git add"
alias gc="git commit -a"
alias gca="git add .; git commit -a"
alias gcm="git add .; git commit -a -m"

alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpt="git push --tags"

alias gph="git push; git push heroku master"

alias gpl="git pull"
alias gplo="git pull origin"
alias gplom="git pull origin master"

alias gcob="git checkout -b"
alias gco="git checkout"
alias gcolast="git checkout HEAD^"

alias grollback="git branch -m crazyexperiment; git checkout HEAD^; git checkout -b master"
alias grollbackhard="git reset --hard HEAD^"

alias grh="git reset --hard"
alias gm="git merge --no-ff"
alias gcp="git cherry-pick"
alias gcd='cd "`git rev-parse --show-toplevel`"'
alias gcl="git clone"

alias glog="git log"
alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate"
alias gll="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat"
alias gl1="git log -1"
alias glplain="git log --pretty=format:'%h %s [%cn]'"
alias gldate="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=short"
alias gld="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=relative"
alias glfile="git log -u"
alias gf="git ls-files | grep -i"
alias glt="git describe --tags --abbrev=0"

gdc_func() {
    git diff $1^..$1
}
alias gdc=gdc_func

glc_func() {
    git log $1^..$1
}
alias glc=glc_func
