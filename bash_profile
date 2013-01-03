# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

[[ -f `brew --prefix`/etc/autojump.bash ]] && . `brew --prefix`/etc/autojump.bash

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
