# Add homebrew executable to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Set vim as default editor
export EDITOR='vim'

# Set globbing to be case-insensitive
setopt NO_CASE_GLOB

### History
# shell history file path
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

### Alias
alias rezr="source ~/.zshrc"

### Functions

# macro to kill the docker desktop app and the VM (excluding vmnetd -> it's a service)
function killdocker() {
  ps ax|grep -i docker|egrep -iv 'grep|com.docker.vmnetd'|awk '{print $1}'|xargs kill
}

PROMPT='%m %~ %# '
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
RPROMPT='%*'

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# ^[[A' up-line-or-search # up arrow bindkey
# ^[[B' down-line-or-search # down arrow 
