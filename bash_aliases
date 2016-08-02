# Misc system stuff
alias ip="ifconfig | grep '\s*inet\ '"
alias tree="tree -aF -L 5 -I 'node_modules|*.un~|.git|.npm'"
alias als="vim ~/.bash_aliases && source ~/.bash_aliases"
alias alslocal="vim ~/.bash_aliases.local && source ~/.bash_aliases"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias update="sudo apt-get update && sudo apt-get upgrade -y"
alias trip="sudo tripwire --check --interactive"
if ! hash tac 2>/dev/null; then
  alias tac="tail -r"
fi

# some bash aliases
if [ "$(uname)" == "Darwin" ]; then
  alias ll="ls -hlopAFG"
  alias la="ls -p1AFG"
  alias ls="ls -p1FG"
else
  alias ll="ls --color=auto -hloptAFG"
  alias la="ls --color=auto -pt1AFG"
  alias ls="ls --color=auto -ptFG"
fi

alias ..="cd .."
alias ...="cd ../.."
alias serve="python -m SimpleHTTPServer 2> /dev/null"

function mvboth() {
    mv $1 $2; mv .$1.un~ .$2.un~;
}
function rmboth() {
    rm $1; rm .$1.un~;
}
alias mvboth=mvboth
alias rmboth=rmboth

alias rmf="rm -rf"

# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
  IFS= read -r header
  printf '%s\n' "$header"
  "$@"
}
alias topmem="ps aux | body sort -nr -k 4 | head -10"
alias topcpu="ps aux | body sort -nr -k 3 | head -10"
alias openports="netstat -tulpn"

# docker aliases
alias cleandocker="docker rm -v $(docker ps -a -q -f status=exited | xargs) && docker rmi $(docker images -f dangling=true -q | xargs)"
alias cleanerdocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q) && docker ps -a | cut -c-12 | xargs docker rm'

# nginx aliases
alias nginxedit="sudo vim /etc/nginx/sites-available/default && sudo service nginx restart"
alias nginxview="vim /etc/nginx/sites-available/default"
alias nginxcheck="nginx -c /etc/nginx/nginx.conf -t"

# npm aliases
alias ni="npm install"
alias nis="npm install --save"
alias nt="npm test"

# git aliases
alias gcf="vim .git/config"

alias g="git status"
alias gd="git diff"
alias gdlast="git diff --cached HEAD^"
function gnew() {
  local mergebase=`git merge-base HEAD $1`
  git diff $mergebase..$1
}
function gnewstat() {
  local mergebase=`git merge-base HEAD $1`
  git diff --stat $mergebase..$1
}

alias gs="git show"
alias gst="git stash"
alias gstl="git stash list"
alias gsta="git stash apply"

alias gb="git branch"
alias gbd="git branch -D"
alias gbdo="git push origin --delete"
alias gba="git branch -a"
alias gbr="git branch -m"  # rename a branch

alias ga="git add"
alias gap="git add -p"
alias gaa="git add --all"
alias gc="git commit"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gcam="git commit -am"

alias gcra="git commit --amend --reset-author --no-edit"
alias gcmsg="git commit --amend"
alias grc="git rebase --continue"

alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpt="git push && git push --tags"
alias gpu="git push -u"
alias gpuo="git push -u origin"

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

alias gcu="git config user.name"
alias gce="git config user.email"

alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]%Cgreen (%ar)' --decorate --graph"
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

alias gsu="git submodule foreach \"(git checkout master; git pull)&\""

# git svn helpers
alias gspl="git svn rebase"
alias gsps="git svn dcommit"

alias todos="git grep -l TODO | xargs -n1 git blame | grep '$(git config user.name)' | grep TODO"

# grunt helpers
alias grt="grunt test"

# screen helpers
alias sls="screen -ls"
alias sr="screen -r"
alias sd="screen -D"
alias sn="screen -S"

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

# user management
alias users="cat /etc/passwd | grep home"
alias deleteuser="userdel -r"
alias generatepassword="cat /dev/random | LC_CTYPE=C tr -dc 'a-zA-Z0-9-_' | fold -w 12 | head -n 4"
