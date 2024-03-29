# Add ~/bin to $PATH for access to personal scripts
# export PATH="$HOME/bin:$PATH"

# Add ~/.docker/bin to $PATH for access to Docker cli tools
export PATH="$HOME/.docker/bin:$PATH"

# set vim as default editor
export EDITOR='vim'

# export HEROKU_APP='**none'

# load rbenv
# eval "$(rbenv init -)"

# load direnv
# eval "$(direnv hook bash)"

# load nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# load yvm
# export YVM_DIR=/usr/local/opt/yvm
# [ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# Load in git completion
source ~/.git-completion.sh

# case insensitive auto-completion
bind "set completion-ignore-case on"

# tab once if ambiguous
bind "set show-all-if-ambiguous on"

# Allow <C-s> to pass through to shell and programs
# stty -ixon -ixoff

# COLOR
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

txtrst='\e[0m'    # Text Reset`

PS1='\n\[\e[0;32m\]${PWD##*/}\[\e[m\]$(__git_ps1) -> '

# ALIAS
alias be="bundle exec"

alias gs="git status"
alias ga="git add"
alias grm="git rm"
alias gcm="git commit -m"
alias gcv="git commit -v"
alias gl="git log"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gp="git push"
alias gb="git branch"
alias gr="git remote"
alias gd="git diff"

alias postgres-server95="postgres -D /usr/local/var/postgresql\@9.5/"
alias postgres-server="postgres -D /usr/local/var/postgres"

alias mongo-server="mongod --config /usr/local/etc/mongod.conf"

alias rebp="source ~/.bash_profile"
alias rebr="source ~/.bash_rc"

#macro to kill the docker desktop app and the VM (excluding vmnetd -> it's a service)
function killdocker() {
  ps ax|grep -i docker|egrep -iv 'grep|com.docker.vmnetd'|awk '{print $1}'|xargs kill
}
