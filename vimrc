set nocompatible    " use vim defaults, must? be first

" ### TABS AND INDENTATION
set tabstop=2           " numbers of spaces of tab character
set expandtab           " expand tabs into spaces
set smarttab            " smart tabbing for autoindent
set autoindent          " copy indent level to next line
"set smartindent         " smart autoindent on new line
set shiftwidth=2        " numbers of spaces to (auto)indent
set backspace=2         " compatibility for delimitMate expand CRs

" ### Set term for arrow key compatibility
"set term=ansi

" ### SEARCH
set hlsearch            " highlight searches
"hi Search ctermbg=blue ctermfg=red term=underline
set incsearch           " search while typing
set ignorecase          " case insensitive search
set smartcase           " case insenstive when lowercase, case sensitive otherwise"

" ### CODE FOLDING
set foldmethod=syntax   " fold based on code syntax
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " don't fold by default
set foldlevel=1         

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
" default the status line when entering VIM, doesn't seem to work?
hi statusline ctermfg=023 ctermbg=0

" set status line colour for insert and replace modes
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=003 ctermbg=0
  elseif a:mode == 'r'
    hi statusline ctermfg=001 ctermbg=0
  else
    hi statusline ctermfg=004 ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=023 ctermbg=0


" ### CUSTOM MAPPINGS
let mapleader = ","

" ;cd to change directory to the dir of the current buffer then display the
" directory path
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" toggles 'paste' mode avoids unpleasant effects e.g. control codes
set pastetoggle=<F2>

" CloseTag
au FileType html,eruby,mako let b:closetag_html_style=1
au FileType html,xhtml,xml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" DelimitMate
imap <leader>m <Plug>delimitMateS-Tab
au FileType ruby let b:delimitMate_quotes = "\" ' ` |"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" NERDTree 
if has("win32") || has("win32unix") || has("win64")
  let g:NERDTreeDirArrows=0
endif
map <F3> :NERDTreeToggle<CR>

" .vimrc
map <leader>v :vsp ~/.vimrc<cr>
map <leader>e :e ~/.vimrc<cr>
map <leader>u :source ~/.vimrc<cr>

" Ctrl-N to disable search match highlight
" Note: Ctrl-N was same as 'k' (move to next line)
nmap <silent> <C-N> :silent noh<CR>

" UltiSnips
let g:UltiSnipsSnippetsDir="~/.vim/bundle/UltiSnips/UltiSnips"


" set nobackup
" set noswapfile

" ### PACKAGE BUNDLING
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'closetag.vim'
Bundle 'ervandew/supertab'
Bundle 'matchit.zip'
Bundle 'mru.vim'
Bundle 'ragtag.vim'
Bundle 'ruby-matchit'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wincent/command-t'
Bundle 'xolox/vim-session'

Bundle 'Raimondi/delimitMate'
Bundle 'TailMinusF'

"Load UltiSnips after Supertabs
Bundle 'UltiSnips'

" ### COLORSCHEM BUNDLES
Bundle 'Solarized'
Bundle 'Zenburn'

" must follow Vundle
filetype plugin indent on

" ### COLORSCHEME - must follow Vundle to use Vundle-installed schemes
" colorscheme railscasts
" colorscheme delek
"colorscheme vibrantink

" ### CUSTOM FUNCTIONS
"
function! MultiExtensionFiletype()
  let ft_default=&filetype
  let ft_prefix=substitute(matchstr(expand('%'),'\..\+\.'),'\.','','g')
  sil exe "set filetype=" . ft_prefix . "." . ft_default
endfunction

"autocmd BufReadPost *.*.* call MultiExtensionFiletype()

