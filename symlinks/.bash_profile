# ========== ALIASES ==========
# General
alias ll="ls -lha"
alias ls="ls -lh"
alias vi="vim"
alias sb="source ~/.bash_profile"
# alias npm_uninstall_all="npm uninstall `ls -1 node_modules | tr '/\n' ' '`; npm cache clear"

# Postgres
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Tmux
alias tn="clear; tmux -CC"
alias ta="clear; tmux -CC attach"
alias tlist="tmux list-sessions"
alias tkill="tmux kill-server"

# Javascript
alias pro="./node_modules/protractor/bin/protractor"

# ========== PATH TWEAKS ==========
export PATH=/usr/local/heroku/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/$EC2_HOME/bin:$PATH
export RBENV_ROOT=/usr/local/rbenv
export EDITOR=/usr/local/bin/vim
export PATH=$PATH:./node_modules/.bin

# ========== OTHER TWEAKS ==========
unset HISTFILE # This stops writing the .bash_history file
export CLICOLOR=1
export LSCOLORS=exfxCxDxBxegedabagacad

# ========== VISUAL TWEAKS ==========
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
