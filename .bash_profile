# Add ~/.rbenv/bin to $PATH for access to the rbenv command-line utility
export PATH="$HOME/.rbenv/bin:$PATH"

# Add ~/bin to $PATH for access to personal scripts
export PATH="$HOME/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/Applications/Firefox.app/Contents/MacOS:$PATH"

export EDITOR='vim'

### Pusher ENV Vars
export PUSHER_APP_ID='42486'
export PUSHER_KEY='272874af6c68c0789d5c'
export PUSHER_SECRET='b8870c9cef7a3ee468ac'

### Cloudinary ENV Vars
export CLOUDINARY_API_KEY='819981746663864'
export CLOUDINARY_CLOUD_NAME='view-the-space-test'
export CLOUDINARY_SECRET='D34dDdIZBHH8Cg-ksz1J0_yZi7Q'
export VTS_S3_CLOUD_NAME='vts-private-test-cld'
export VTS_S3_API_KEY='549532733968861'
export VTS_S3_SECRET='rdqS7jCw8bsgwcBjfSD-70Zgggo'

export CAPYBARA_WAIT_TIME=5
# export DISABLE_STRICT=true

source ~/.nvm/nvm.sh

# Add rbenv init to shell to enable shims and autocompletion
eval "$(rbenv init -)"

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

# PROMPT
print_before_the_prompt () {
    printf "\n$txtwht%s $txtwht%s$txtrst" "${PWD##*/}" "$(__git_ps1 '(%s)')"
}

# PROMPT_COMMAND=print_before_the_prompt

PS1='\n\[\e[0;36m\]${PWD##*/}\[\e[m\]$(__git_ps1) -> '

# ALIAS
alias be="bundle exec "
alias doit="rake db:drop; rake db:create && rake db:migrate && rake db:seed"

alias gi="git init "
alias gs="git status "
alias ga="git add "
alias gaa="git add --all "
alias grm="git rm "
alias gcm="git commit -m "
alias gcv="git commit -v "
alias gl="git log "
alias gc="git checkout "
alias gcb="git checkout -b "
alias gp="git push "
alias gb="git branch "
alias gr="git remote "
alias gd="git diff "

alias rs="rails s "
alias rc="rails c "

alias rebp="source ~/.bash_profile"
alias rebr="source ~/.bash_rc"
alias tailtest="tail -f log/test.log"
alias fix-karma="ulimit -S -n 2048"

alias zs="zeus server"
alias zc="zeus console"
alias zt="zeus test"
alias ztf="zeus test --fail-fast"
alias produrl="ssh -i ~/.ssh/`whoami`_audit_db_dsa `whoami`@`dig +short auditdb.vts.com | grep -E ^[0-9].*[0-9]` './create_temp_creds.sh'"
alias auditdb="DATABASE_URL=`produrl` rails c"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
