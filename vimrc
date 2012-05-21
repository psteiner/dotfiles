set nocompatible    " use vim defaults, must? be first


" disabled for Vundle compatibility
" to indent automatically depending on filetype
" filetype indent on


" ### TABS AND INDENTATION
set tabstop=2           " numbers of spaces of tab character
set expandtab           " expand tabs into spaces
set smarttab            " smart tabbing for autoindent
set autoindent          " copy indent level to next line
"set smartindent         " smart autoindent on new line
set shiftwidth=2        " numbers of spaces to (auto)indent
set backspace=2         " compatibility for delimitMate expand CRs

" ### SEARCH
set hlsearch            " highlight searches
set incsearch           " search while typing
set ignorecase          " case insensitive search
set smartcase           " case insenstive when lowercase, case sensitive otherwise"

" ### UI STUFF
syntax on               " Turn on highlighting
set background=dark   " assume dark background 
set showcmd             " display incomplete commands
set ruler               " show the cursor position all the time
set title               " show title in console title bar
set lbr                 " wrap text
set ls=2                " always show status line
set nu                  " turn on line numbering
"set showmatch           " show matching brackets
" disable matching paren highlighting
let g:loaded_matchparen=1

set hidden              " allow unwritten buffer changes on :e
set history=1000        " remember more commands and history
set undolevels=1000     " lots of undo

" ### STATUS LINE
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=6 ctermbg=0
  elseif a:mode == 'r'
    hi statusline ctermfg=5 ctermbg=0
  else
    hi statusline ctermfg=1 ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=8 ctermbg=15

" default the status line to green when entering VIM
hi statusline ctermfg=8 ctermbg=15

" ### CUSTOM MAPPINGS
"let mapleader = ","

set pastetoggle=<F2>

" CloseTag
au FileType html,eruby,mako let b:closetag_html_style=1
au FileType html,xhtml,xml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" DelimitMate
imap <leader>] <Plug>delimitMateS-Tab
au FileType ruby let b:delimitMate_quotes = "\" ' ` |"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" .vimrc
map <leader>v :vsp ~/.vimrc<cr>
map <leader>e :e ~/.vimrc<cr>
map <leader>u :source ~/.vimrc<cr>

" Ctrl-N to disable search match highlight
" Note: Ctrl-N was same as 'k' (move to next line)
nmap <silent> <C-N> :silent noh<CR>


" set nobackup
" set noswapfile

" ### COLORSCHEME
" colorscheme railscasts
" colorscheme delek
colorscheme vibrantink

" ### PACKAGE BUNDLING
" using Vundle instead
" call pathogen#infect() " load pathogen

" Disable Vundle if Bundle* commands
" conflict with tpope/vim-bundler
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-bundler' 
Bundle 'tpope/vim-surround'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

" snipmate S-TAB conflicts with delimitMate
"Bundle 'msanders/snipmate.vim'

Bundle 'TailMinusF'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-endwise'
Bundle 'ragtag.vim'
Bundle 'mru.vim'
Bundle 'xolox/vim-session'
Bundle 'closetag.vim'

Bundle 'ruby-matchit'
Bundle 'matchit.zip'

filetype plugin indent on

