# Add ~/.rbenv/bin to $PATH for access to the rbenv command-line utility
export PATH="$HOME/.rbenv/bin:$PATH"

# Add ~/bin to $PATH for access to personal scripts
export PATH="$HOME/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/Applications/Firefox.app/Contents/MacOS:$PATH"

# Add rbenv init to shell to enable shims and autocompletion
eval "$(rbenv init -)"

# case insensitive auto-completion
bind "set completion-ignore-case on"

# tab once if ambiguous
bind "set show-all-if-ambiguous on"

# COLOR
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset`

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# Load in git completion
source ~/.git-completion.sh

# PROMPT
print_before_the_prompt () {
    printf "\n$txtblu%s $txtwht%s$txtrst" "${PWD##*/}" "$(__git_ps1 '(%s)')"
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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

