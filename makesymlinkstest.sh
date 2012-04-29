#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

dir=~/testdir                    # dotfiles directory
olddir=~/testdir_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="chuck bobdir"    

##########

# create dotfiles in homedir
echo "Creating $dir"
mkdir -p $dir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# make copies of listed dotfiles from homedir into dotfiles dir
echo "Copying dotfiles to $dir"
for file in $files; do
  cp -r ~/.$file $dir/$file
  echo "Copying .$file to $dir/$file"
done

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files

echo "Moving any existing dotfiles from ~ to $olddir"

for file in $files; do
    if [ ! -e $olddir/.$file ]; then mv ~/.$file $olddir ; fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

