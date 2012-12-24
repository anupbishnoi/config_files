# some bash aliases
alias ll='ls -hlaoptAFG'
alias la='ls -ptAFG'
alias ls='ls -ptFG'
alias grep='grep -in'

# GTD tools
alias ijust='echo >> ~/ijust'
alias about='cat ijust | grep -i'
alias t='todo.sh'

# coding tools
alias jsdocs='rocco -l js'
# jsdocs -o output/ file.js

# git aliases
alias gd="git diff"
alias ga="git add"
alias gbd="git branch -D"
alias gst="git status"
alias gca="git add .; git commit -a"
alias gcm="git add .; git commit -a -m"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias gpo="git push origin"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gpom="git pull origin master"
alias gcd='cd "`git rev-parse --show-toplevel`"'
alias gcl="git clone"
alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate"
alias gll="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat"
alias glplain="git log --pretty=format:'%h %s [%cn]'"
alias gldate="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=short"
alias gld="git log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=relative"
alias glfile="git log -u"
alias gdlast="git diff --cached HEAD^"
alias gf="git ls-files | grep -i"
alias glt="git describe --tags --abbrev=0"

gdr_func() {
    git diff $1^..$1
}
alias gdr=gdr_func

glc_func() {
    git log $1^..$1
}
alias glc=glc_func
