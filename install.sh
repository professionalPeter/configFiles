#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# based on: https://github.com/dimafeng/dotfiles/blob/master/install.sh
############################

link_configs() {
    dir=~/software/configFiles                    # dotfiles directory
    olddir=~/configFiles_old             # old dotfiles backup directory
    files="zshrc vimrc xvimrc gitconfig gitignore_global zsh"    # list of files/folders to symlink in homedir

    ##########

    # create dotfiles_old in homedir
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
    echo "...done"

    # change to the dotfiles directory
    echo "Changing to the $dir directory"
    cd $dir
    echo "...done"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
    for file in $files; do
      if [ -L ~/.$file ]
      then
        rm ~/.$file
      else
        mv ~/.$file $olddir/
      fi

      echo "Creating symlink to .$file in home directory."
      ln -s $dir/.$file ~/.$file
    done
}

case "$1" in # add more install options here
    link)
        link_configs
        ;;
    *)
	link_configs
        ;;
esac
