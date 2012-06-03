#!/usr/local/bin/ruby
#==================================
# dotfiler.rb
# manage dotfiles for backup in source control e.g. github
# by moving specified dotfiles into a subdirectory of the
# user account then symlinking to them from the home directory
# 

require 'fileutils'

=begin
require 'trollop'

opts = Trollop::options do
  version "#{$0} 0.1"
  banner <<-EOS
#{$0} helps you manage "dotfiles", e.g. .bashrc, .vimrc and
directories that you want to keep under source control. 

Usage:
      ${$0} <filename>+
EOS

  opt :files, "List of dotfiles", :type => Array
end

Trollop::die :files, "must specify dotfiles" if opts[:files].empty?
=end

if ARGV.empty? 
  puts "Usage: #{$0} <filenames>+" 
  exit 1
end

files = ARGV

### VARIABLES

homedir = ENV['HOME']
dotdir = (homedir +'/dotfiles') # dotfiles directory
olddir = (homedir +'/oldfiles') # old dotfiles directory

###

def create_dir(name)
  # create dotdir if it doesn't exist
  if File.exists?(name)
    puts "Found #{name}"
  else
    puts "Creating #{name}"
    Dir::mkdir(name)
    puts "...done"
  end
end

create_dir(dotdir)

create_dir(olddir)

# back up dotfiles to olddir
puts "Backing up existing dotfiles from ~ (#{homedir}) to #{olddir}"

# loop on files in home directory. Specified files that do not exist
# in the directory are ignored
Dir.foreach(homedir) do |fname|

  # only process specified files
  if files.include?(fname)

    backup = "#{olddir}/#{fname}"
    src = "#{homedir}/#{fname}"
    target = "#{dotdir}/#{fname.sub(".","")}"

    if File.symlink?(src)
      # skip specified files that are already symlinks, assume they have
      # already been processed, also attempts to ensure backup is not
      # overwritten by a symlink
      puts "Skipping symlink #{src} to #{target}"
    elsif File.file?(src) 
      puts
      puts "Found new dotfile #{src}"

      is_backed_up = false
      is_in_dotfiles = false

      # backup source file to backup directory
      if File.exists?(backup)
        puts "...Backup found #{backup}"
        is_backed_up = true
      else
        puts "...Backing up #{src} to #{backup}"
        FileUtils.copy(src,backup)

        if File.exists?(backup)
          is_backed_up = true
        else
          puts "...Backup failed for #{src}"
          exit 1
        end
      end

      # copy source file to dotfiles directory if it is not already 
      # in the dotfiles dir
      if File.exists?(target)
        puts "...Already have #{target}"
        is_in_dotfiles = true
      else
        puts "...Moving #{src} to #{target}"
        FileUtils.move(src,target)
        
        if File.exists?(target)
          is_in_dotfiles = true
        else
          puts "...Move failed for #{src}"
          exit 1
        end
      end

      # symlink from home to dot file
      if is_backed_up && is_in_dotfiles
        if File.exists?(src)
          File.delete(src)
        end
        puts "...Making symlink from #{src} to #{target}"
        File.symlink(target,src)
      else
        puts "...Did not make symlink for #{src}"
      end
      
    elsif File.directory?(src)
      puts
      puts "Found new directory #{src}"

      puts "...Backing up #{src} to #{backup}"

      puts "...Moving #{src} to #{target}"

      puts "...Making symlink from #{src} to #{target}"

    else
      puts
      puts "Error, not a file or directory!"
    end

  else
    puts "Skipped #{fname}"
  end
end


puts "...done"

