#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

dotdir=~/dotfiles                    # dotfiles directory
olddir=~/oldfiles             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="bash_aliases bash_login bash_logout bash_profile bashrc gemrc gitconfig gitignore_global inputrc irbrc minttyrc vimrc"    

##########

# create olddir in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotdir directory"
cd $dotdir
echo "...done"

# move any existing dotfiles in homedir to olddir, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files

for file in $files; do
  if [ -e ~/.$file ] && [ ! -h ~/.$file ]; then
    echo "Moving ~/.$file to $olddir"
    mv ~/.$file $olddir/
  fi
  echo "Creating symlink to $file in home directory."
  ln -s $dotdir/$file ~/.$file
done

