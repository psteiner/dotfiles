set nu						" turn on line numbering
syntax on			" set syntax on
" filetype indent on " disabled for Vundle compatibility indent automatically depending on filetype
set lbr						" wrap text
set nocompatible    " use vim defaults
set notitle    " Do not override the title in xterm
set ls=2            " allways show status line
set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set expandtab			" expand tabs
set softtabstop=2		" 
set smarttab
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set ruler           " show the cursor position all the time
set title           " show title in console title bar
set autoindent     " always set autoindenting on
set smartindent        " smart indent
set hidden          " allow unwritten buffer changes on :e
set history=1000    " remember more commands and history
set undolevels=1000 " lost of undo
set title           " change the terminal's title
" set nobackup
" set noswapfile

" colorscheme railscasts
" colorscheme delek
colorscheme vibrantink
" call pathogen#infect() " load pathogen

" Disabled Vundle because its Bundle* commands
" conflict with tpope/vim-bundler
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler' 
Bundle 'tpope/vim-git'
Bundle 'jiangmiao/auto-pairs'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'


filetype plugin indent on

