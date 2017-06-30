# Misc system stuff
alias ip="ifconfig | grep '\s*inet\ '"
alias tree="tree -aF -L 5 -I 'node_modules|*.un~|.git|.npm|ShaderCache|metadata|Temp'"
alias als="vim ~/.bash_aliases && source ~/.bash_aliases"
alias alslocal="vim ~/.bash_aliases.local && source ~/.bash_aliases"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias update="sudo apt-get update && sudo apt-get upgrade -y"
alias trip="sudo tripwire --check --interactive"
if ! hash tac 2>/dev/null; then
  alias tac="tail -r"
fi

if [ "$(uname)" == "Darwin" ]; then
  alias ll="ls -hlopAFG"
  alias la="ls -p1AFG"
  alias ls="ls -p1FG"
  alias filesizes="du -hs * | gsort -h"
else
  alias ll="ls --color=auto -hloptAFG"
  alias la="ls --color=auto -pt1AFG"
  alias ls="ls --color=auto -ptFG"
  alias filesizes="du -hs * | sort -h"
fi

alias ..="cd .."
alias ...="cd ../.."
alias serve="python -m SimpleHTTPServer 2> /dev/null"
alias filename="${filename%.*}"

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
alias cleandocker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q) && docker ps -a | cut -c-12 | xargs docker rm'

# nginx aliases
alias nginxedit="sudo vim /etc/nginx/sites-available/default && sudo service nginx restart"
alias nginxview="vim /etc/nginx/sites-available/default"
alias nginxcheck="nginx -c /etc/nginx/nginx.conf -t"

# npm aliases
alias ni="npm install"
alias nis="npm install --save"
alias nid="npm install --save-dev"
alias nt="npm test"
alias nv="npm version"

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
function fade() {
  if ! [ $# -eq 3 ]; then
    echo "Usage: fade source.png 30% source-faded.png"
  else
    convert $1 -fill white -colorize $2 $3
  fi
}


# grunt helpers
alias grt="grunt test"

# screen helpers
alias sls="tmux list-sessions"
alias sr="tmux -CC attach -t"
alias sd="tmux detach"
alias sn="tmux -CC new -s"

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

# user management
alias users="cat /etc/passwd | grep home"
alias deleteuser="userdel -r"
alias generatepassword="cat /dev/random | LC_CTYPE=C tr -dc 'a-zA-Z0-9-_' | fold -w 12 | head -n 4"

alias npmdeploy="npm version patch && git push && git push --tags && npm publish" 

function video2gif() {
  if ! [ $# -eq 4 ]; then
    echo "Usage: video2gif input.mov 10 640 output.gif     # (for fps 10 & width 640)"
  else
    ffmpeg -y -i $1 -vf fps=$2,scale=$3:-1:flags=lanczos,palettegen /tmp/palette.png
    ffmpeg -i $1 -i /tmp/palette.png -filter_complex "fps=$2,scale=$3:-1:flags=lanczos[x];[x][1:v]paletteuse" $4
  fi
}

function videoslower() {
  if ! [ $# -eq 3 ]; then
    echo "Usage: videoslower input.mov 0.5 output.mov   # (0.5 means twice as fast)"
  else
    ffmpeg -i $1 -filter:v "setpts=$2*PTS" $3
  fi
}
