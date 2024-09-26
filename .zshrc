##### Time zsh loading #####
# zmodload zsh/zprof

# Initialize zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Path to your oh-my-zsh installation.
export ZSH=/Users/ragasthya/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
DEFAULT_USER="ragasthya"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl docker kube-ps1)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/sbin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/python@2/bin:/usr/local/opt/python@2/libexec/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Options to enable/disable after oh-my-zsh is loaded
unsetopt share_history

# Plugin configuration
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# Use MacVim's vim
# alias vim='mvim -v'
# Alias vi to vim to avoid version conflicts with YCM plugin
# alias vi='mvim -v'
# Alias rg to prevent search vendor dir
# Alias to copy ssh public key
alias sshcopy="echo -n $(cat ~/.ssh/id_ed25519.pub | rev | cut -d ' ' -f 2- | rev) | pbcopy"

# Virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/venvprojects
# source /usr/local/bin/virtualenvwrapper.sh

# Go paths
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z - jump around
. ~/z.sh

##### Time zsh loading #####
# zprof
# alias python=/usr/local/opt/python3
# alias pip=/usr/local/bin/pip3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Load pyenv into the shell by adding
# the following to ~/.zshrc:

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export PATH="/usr/local/opt/ncurses/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"

#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

# VMW DBC
alias sshdbc='ssh ragasthya@sc-dbc2159.eng.vmware.com'

export DOCKER_BUILDKIT=1

alias -g y="-o yaml | yh"
alias -g yl="-o yaml | yh | less"


# Ignore interactive fzf mode
# export KUBECTX_IGNORE_FZF=1

# kube-ps1 plugin (enabled above) prompt
PROMPT='$(kube_ps1) '$PROMPT
# RPROMPT='$(kube_ps1)'

# Direnv for zsh
# Direnv requires loading after all the shell extensions that manipulate the prompt
eval "$(direnv hook zsh)"

# Kubectl Krew plugins
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# gcloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# ruby
source "$(brew --prefix)/opt/chruby/share/chruby/chruby.sh"
source "$(brew --prefix)/opt/chruby/share/chruby/auto.sh"

# ls colors
alias ls="ls --color=auto"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

