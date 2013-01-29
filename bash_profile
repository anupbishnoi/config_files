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

export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"

export PATH=/Users/anup/bin/Sencha/Cmd/3.0.0.250:$PATH

export SENCHA_CMD_3_0_0="/Users/anup/bin/Sencha/Cmd/3.0.0.250"
