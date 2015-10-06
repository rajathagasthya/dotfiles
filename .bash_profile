alias vi='vim'
alias cl='clear'
alias cd1='cd ..;pwd'
alias cd2='cd ..;cd ..;pwd'
alias cd3='cd ..;cd ..;cd ..;pwd'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vsuspend='vagrant suspend'
alias vreload='vagrant reload'
alias pnr='cd /Users/rajagast/Cisco/PNR/openstack-cisco-cpnrdhcp-driver'



if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export FPP_EDITOR=vim
