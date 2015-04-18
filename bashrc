# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# CUSTOM
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

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

# Awesome Bash Prompt
PS1='\[\e[36m\]$(shortened_str "$PWD" 23) \[\e[$(git_status_color)m\]$(git_branch)\[\e[36m\]→\[\e[0m\] '

export PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH:$HOME/bin:$HOME/local/bin:$HOME/.node/bin:/var/lib/gems/1.8/bin:/usr/local/mysql/bin:/usr/lib/python2.7/site-packages:/usr/local/lib/node_modules
export PYTHONPATH="$HOME/lib/python2.7/site-packages"
LYNX_CFG=~/.lynx/lynx.cfg; export LYNX_CFG
export EDITOR=/usr/bin/vim

export DEBUG="apper,cgi,app"
