#/bin/bash

# Links in the dotfiles to the git repo, so you don't have everything in one place.

echo "=================================================="
echo "=YOU ARE ABOUT TO ANNIHILATE YOUR CURRENT FILES.=="
echo "======DID YOU MAKE A BACKUP OF EVERYTHING?========"
echo "=================================================="
echo "This script assumes that this script is being run="
echo "from a local folder ~/dev/dotfiles. You should===="
echo "probably read through the script before running.=="
echo "=================================================="

install(){
    # I'm really not sure why this .vim links to itself in the
    # git repo here, but I guess I'll remove it right after...
    ln -fs ~/dev/dotfiles/.vim/ ~/.vim; echo "."
    rm .vim/.vim # Hack work-around... Should fix this...
    ln -fs ~/dev/dotfiles/.tmux.conf ~/.tmux.conf; echo "."
    ln -fs ~/dev/dotfiles/.vimrc ~/.vimrc; echo "."
    ln -fs ~/dev/dotfiles/.zshrc ~/.zshrc; echo "."
}

while true; do
    read -p "Are you sure you want to continue? (yes/no)" yn
    echo ""
    case $yn in
        [Yy]* ) install; exit;;
        [Nn]* ) echo "ABORT: no changes made"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done