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


# Install powerline-fonts
# Install z.sh script
# Parameterize username and replace it in .zshrc

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Tmux status bar theme
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
