# Image gallery from file system (n-gallery)
alias gallery="~/node_modules/n-gallery/bin/n-gallery"

alias ip="ifconfig | grep '\s*inet\ '"
alias tree="tree -aF -L 5 -I 'node_modules|*.un~|.git|.npm'"
alias als="vim ~/.bash_aliases; . ~/.bash_aliases"

# some bash aliases
alias ll="ls --color=auto -hlaoptAFG"
alias la="ls --color=auto -ptAFG"
alias ls="ls --color=auto -ptFG"

alias ..="cd .."
alias ...="cd ../.."

function mvboth() {
    mv $1 $2; mv .$1.un~ .$2.un~;
}
function rmboth() {
    rm $1; rm .$1.un~;
}
alias mvboth=mvboth
alias rmboth=rmboth

# git aliases
alias gcf="vim .git/config"

alias g="git status"
alias gd="git diff"
alias gdlast="git diff --cached HEAD^"
alias gs="git show"
alias gst="git stash"

alias gb="git branch"
alias gbd="git branch -D"
alias gba="git branch -a"
alias gbr="git branch -m"  # rename a branch

alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gcam="git commit -am"

alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpt="git push --tags"

alias gf="git fetch"

alias gpl="git pull"
alias gplo="git pull origin"
alias gplom="git pull origin master"

alias gcob="git checkout -b"
alias gco="git checkout"
alias gcolast="git checkout HEAD^"

alias grollback="git reset --hard HEAD^"

alias grh="git reset --hard"
alias gm="git merge --no-ff"
alias gmf="git merge"
alias gcp="git cherry-pick"
alias gcd='cd "`git rev-parse --show-toplevel`"'
alias gcl="git clone"

alias gun="git config user.name"
alias gue="git config user.email"

alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate"
alias glf="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat"
alias glplain="git log"
alias gldate="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=short"
alias gld="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=relative"

function gdc() {
    git diff $1^..$1
}

function glc() {
    git log $1^..$1
}

# git svn helpers
alias gspl="git svn rebase"
alias gsps="git svn dcommit"

