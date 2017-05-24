# dotfiles
My treasured dotfiles. 

Symlinks common dotfiles such as `.vimrc`, `.tmux.conf`, `.zshrc`, `.gitconfig` to the home directory and installs `vim` plugins specified in `.vimrc` using `Vundle`. The script takes a backup of existing config files, if you have any. 

## Instructions
Make sure to have `git` installed before you do this. 

1. Clone the repository
```
$ git clone git@github.com:rajathagasthya/dotfiles.git ~/dotfiles
```
2. Execute bootstrap script
```
$ cd ~/dotfiles
$ ./bootstrap.sh
```
