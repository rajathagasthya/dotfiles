#!/bin/sh

# Bootstrap script to configure rc files and install vim plugins

set -e

# Current directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks for rc files in home directory
declare -a files=(".vimrc" ".tmux.conf" ".zshrc" ".gitconfig" ".ideavimrc")

for i in "${files[@]}"
do
    if [ -e "${HOME}/$i" ]; then
        echo "${HOME}/$i already exists. Creating a backup of the file."
        mv "${HOME}/$i" "${HOME}/$i.bak"
    fi
    echo "Creating symlink ${HOME}/$i -> $DIR/$i"
    ln -s "$DIR/$i" ${HOME}/"$i" 
done

# Install Vundle
if [ -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
    echo "${HOME}/.vim/bundle/Vundle.vim already exists. Skipping git clone."
else
    echo "Cloning Vundle to ${HOME}/.vim/bundle/Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi

# Install vim plugins
vim +PluginInstall +qall
