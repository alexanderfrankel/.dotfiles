# Add homebrew executable to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Set vim as default editor
export EDITOR='vim'

# Set key sequence timeout
export KEYTIMEOUT=1

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

### Auto completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

### Alias
alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gcv='git commit -v'
alias gd='git diff'
alias rezsh='source ~/.zshrc'

### Functions

# macro to kill the docker desktop app and the VM (excluding vmnetd -> it's a service)
function killdocker() {
  ps ax|grep -i docker|egrep -iv 'grep|com.docker.vmnetd'|awk '{print $1}'|xargs kill
}

### fzf
# Add fzf to path if not already there
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Enable auto-completion
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Enable key-bindings
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Set default command
export FZF_DEFAULT_COMMAND='find . \! \( -path ./.git -prune \)'

# Set default options
export FZF_DEFAULT_OPTS="-m \
                        --height 50% \
                        --border \
                        --preview 'bat --color=always {1}'"

# Apply default command to Ctrl-T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### Command prompt

# Git info
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{250}(%b)%f'
zstyle ':vcs_info:*' enable git

# Prompt
PROMPT='%B%F{147}MBP%f %F{252}%~%f%b ${vcs_info_msg_0_} %# '
