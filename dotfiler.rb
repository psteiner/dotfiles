#!/usr/local/bin/ruby
#==================================
# dotfiler.rb
# manage dotfiles for backup in source control e.g. github
# by moving specified dotfiles into a subdirectory of the
# user account then symlinking to them from the home directory
# 

### VARIABLES

dotdir = (ENV['HOME']+'/dotfiles') # dotfiles directory
olddir = (ENV['HOME']+'/oldfiles') # old dotfiles directory

# list of files and folders to manage
files = "bob chuck ted_dir"

###

# create dotdir if it doesn't exist
puts "Creating #{dotdir}"
Dir::mkdir(dotdir) unless File.exists?(dotdir)
puts "...done"

# create olddir if it doesn't exist
puts "Creating #{olddir} for backup of existing dotfiles in ~"
Dir::mkdir(olddir) unless File.exists?(olddir)
puts "...done"

# copy files from home into dotdir
puts "Copying dotfiles into #{dotdir}"
# skip on symlinks in ~

puts "...done"

# back up dotfiles to olddir
puts "Backing up existing dotfiles from ~ to #{olddir}"

# for each file in $files 

# unless $file exists,
# move file to olddir
puts "Creating symlink to file in home dir"
# make symlink from ~ to $file

