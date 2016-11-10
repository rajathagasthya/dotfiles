# Path to your oh-my-zsh installation.
export ZSH=/Users/rajagast/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="rajagast"

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
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/bin/jamf:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# The fuck alias
eval $(thefuck --alias)

# Alias vi to vim to avoid version conflicts with YCM plugin
alias vi=vim

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/venvprojects
source /usr/local/bin/virtualenvwrapper.sh

# Autoenv
source $(brew --prefix autoenv)/activate.sh

# Metacloud specific aliases

# Set these according to whatever proxmox host and slot you use
PROXMOX=proxmox16
PASLAB=paslab016000


# quick access via the axion ssh_config
# ex: sshaxion mcp1
alias sshaxion="ssh -F ~/.axion/ssh_config "


# quick access to the proxmox host
# ex: sshproxmox
alias sshproxmox="ssh ${PROXMOX}.lab1.mc.metacloud.in"

# easy access to the ssh forwarding tunnel
# ex: open_tunnel
function open_tunnel {
    ssh -L 3128:$(sshaxion mcp1 cat /etc/hosts | grep mcp1 | cut -d' ' -f1):3128 ${PROXMOX}.lab1.mc.metacloud.in
}

# opens the horizon dashboard in your browser!
# ex: open_dashboard
function open_dashboard {
    open -a "/Applications/Google Chrome.app" "https://$(sshaxion mcp1 cat /etc/hosts | grep dashboard | cut -d' ' -f2)"
}

# same as above, but points to the zabbix app
# ex: open_zabbix
function open_zabbix {
    open "http://util1.${PASLAB}.mc.metacloud.in/zabbix/index.php"
}
# get the IP address to a VM
# ex: get_ip mhv3
# ex: get_ip util1
function get_ip {
    sshaxion mcp1 cat /etc/hosts | grep ${1} | cut -d' ' -f1
}

# See afplay --help for more info and /System/Library/Sounds for some sound
# files
# Examples:
# notify ansible-playbook ...
# notify sleep 5
function notify {
    $@; afplay /System/Library/Sounds/Glass.aiff -v 5
}

# Generic iTerm tmux alias to ssh to a server and enter a tmux session
function sshtmux {
    ssh ${1} -t "tmux -CC attach || tmux -CC"
}

# Axion iTerm tmux alias to ssh to a server and enter a tmux session
function sshatmux {
    sshaxion ${1} -t "tmux -CC attach || tmux -CC"
}
