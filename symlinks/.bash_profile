# ========== ALIASES ==========
# General
alias ll="ls -lha"
alias ls="ls -lh"
alias vi="vim"
alias sb="source $HOME/.bash_profile"

# Postgres
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Tmux
alias tn="clear; tmux -CC"
alias ta="clear; tmux -CC attach"
alias tlist="tmux list-sessions"
alias tkill="tmux kill-server"

# ========== PATH TWEAKS ==========
export PATH=/usr/local/bin:/usr/local/sbin:./node_modules/.bin:$PATH
export RBENV_ROOT=/usr/local/rbenv
export EDITOR=/usr/local/bin/vim

# ========== CUSTOM ENVS ==========
export HISTFILE=$HOME/.history/.bash_history
export NODE_REPL_HISTORY=$HOME/.history/.node_repl_history
export MYSQL_HISTFILE=$HOME/.history/.mysql_history

# ========== VISUAL TWEAKS ==========
export CLICOLOR=1
export LSCOLORS=exfxCxDxBxegedabagacad

txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtrst='\e[0m'    # Text Reset

# Custom prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="$txtblu\u: \$PWD\[$txtpur\$(parse_git_branch)\[$txtrst\n$"

# ========== FUNCTIONAL TWEAKS ==========
# Git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export SRCPATH=$HOME/src
export GOPATH=$SRCPATH/go
export PATH="${PATH}:$GOPATH/bin:$HOME/bin"
