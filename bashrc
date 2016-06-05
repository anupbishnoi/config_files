# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# turn off terminal suspension feature (ctrl-s)
stty -ixon

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Awesome Bash Prompt
if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\e[36m\]$(shortened_str "$PWD" 23) \[\e[$(git_status_color)m\]$(git_branch)\[\e[36m\]→\[\e[0m\] '

else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='$(shortened_str "$PWD" 23) $(git_branch) → '
fi
unset color_prompt force_color_prompt

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
__git_complete gco _git_checkout
__git_complete gp _git_push
__git_complete gcl _git_clone
__git_complete gb _git_branch
__git_complete gbd _git_branch
__git_complete gpu _git_push
__git_complete gco _git_push

# Passed string shortened to specified characters
function shortened_str () {
    local PRE= NAME="$1" LENGTH="$2";
    [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
        PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
    ((${#NAME}>$LENGTH)) && NAME="/..${NAME:$[${#NAME}-LENGTH+4]}";
    echo "$PRE$NAME"
}

# Colors for the three possible git commit states
function git_status_color() {
    local status="`git status -unormal 2>&1`"
    if ! [[ "$status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$status" =~ nothing\ to\ commit ]]; then
            echo -n 32
        elif [[ "$status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            echo -n 34
        else
            echo -n 35
        fi
    fi
}

# Name of current branch
function git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* \(.*\)/(\1)/'
}

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export GEM_HOME=$HOME/.gem
export PATH=$PATH:$HOME/bin:$GEM_HOME/bin:$GEM_HOME/ruby/2.0.0/bin
export EDITOR=/usr/bin/vim
export DEBUG="apper,cgi,app"

if [ -f ~/.resty.sh ]; then
    . ~/.resty.sh
fi

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
