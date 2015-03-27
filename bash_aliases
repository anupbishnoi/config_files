# some bash aliases
alias ll="ls -hlaoptAFG"
alias la="ls -ptAFG"
alias ls="ls -ptFG"
alias als="vim ~/.bash_aliases; . ~/.bash_aliases"
alias tree="tree -I node_modules"
alias noex="chmod -x *.*; chmod -x .*.un~"
alias findfile="find . | grep -i"

function mvboth() {
    mv $1 $2; mv .$1.un~ .$2.un~;
}
function rmboth() {
    rm $1; rm .$1.un~;
}

# coding tools
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

function gp() {
    if [ -f "./.gitpush" ]
    then
        ./.gitpush
    else
        git push
    fi
}
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpt="git push --tags"

alias gpl="git pull"
alias gplo="git pull origin"
alias gplom="git pull origin master"

alias gcob="git checkout -b"
alias gco="git checkout"
alias gcolast="git checkout HEAD^"

alias grollback="git reset --hard HEAD^"

alias grh="git reset --hard"
alias gm="git merge --no-ff"
alias gcp="git cherry-pick"
alias gcd='cd "`git rev-parse --show-toplevel`"'
alias gcl="git clone"

alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate"
alias gll="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat"
alias gl1="git log -1"
alias glplain="git log --pretty=format:'%h %s [%cn]'"
alias gldate="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=short"
alias gld="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=relative"
alias glfile="git log -u"
alias gf="git ls-files | grep -i"
alias glt="git describe --tags --abbrev=0"

function gdc() {
    git diff $1^..$1
}

function glc() {
    git log $1^..$1
}

# git svn helpers
alias gspl="git svn rebase"
alias gsps="git svn dcommit"

alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"

alias ip="ifconfig | grep '\s*inet\ '"
