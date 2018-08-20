# Add ~/bin to $PATH for access to personal scripts
export PATH="$HOME/bin:$PATH"

# set vim as default editor
export EDITOR='vim'

# load rbenv
eval "$(rbenv init -)"

# load nodenv
eval "$(nodenv init -)"

# case insensitive auto-completion
bind "set completion-ignore-case on"

# tab once if ambiguous
bind "set show-all-if-ambiguous on"

# Allow <C-s> to pass through to shell and programs
stty -ixon -ixoff

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

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# Load in git completion
source ~/.git-completion.sh

PS1='\n\[\e[0;36m\]${PWD##*/}\[\e[m\]$(__git_ps1) -> '

# CONNECT TO REMOTE DB
connect_to_remote_db() {
  DATABASE_URL=`heroku config:get DATABASE_URL -a $2` rails $1
}

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

alias rs="rails s"
alias rc="rails c"

alias rebp="source ~/.bash_profile"
alias rebr="source ~/.bash_rc"
alias tailtest="tail -f log/test.log"

alias zs="zeus server"
alias zc="zeus console"
alias zt="zeus test"
alias ztf="zeus test --fail-fast"
alias kzs="pid=$(pgrep -n zeus-darwin-amd64 server); kill -9 $pid"

alias remote-rails=connect_to_remote_db
alias postgres-server96="postgres -D /usr/local/var/postgresql\@9.6/"
alias postgres-server="postgres -D /usr/local/var/postgres"

alias weather="curl wttr.in/nyc"

alias restore-common-dev="cat README.md | grep curl | bash"
