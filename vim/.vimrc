" VIM Configuration - Vincent Jousse
" Cancel the compatibility with Vi. Essential if you want
" to enjoy the features of Vim
set nocompatible
" -- Display
set title " Update the title of your window or your terminal
set number " Display line numbers
set relativenumber " Display relative numbers 
set ruler " Display cursor position
set wrap " Wrap lines when they are too long
set scrolloff=3 " Display at least 3 lines around you cursor
" (for scrolling)
set guioptions=T " Enable the toolbar
" -- Search
set ignorecase " Ignore case when searching
set smartcase " If there is an uppercase in your search term
" search case sensitive again
set incsearch " Highlight search results when typing
set hlsearch " Highlight search results
" -- Beep
set visualbell " Prevent Vim from beeping
set noerrorbells " Prevent Vim from beeping
" Backspace behaves as expected
set backspace=indent,eol,start
" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden
" Enable syntax highlighting
syntax enable
" activate pathogen
execute pathogen#infect()
" Enable file specific behavior like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Add paste toggle, so when pasting code, deactiavte auto indenting
set pastetoggle=<F2>
" Set NerdTree Toggle to F3
nmap <F3> :NERDTreeToggle<CR>
" Add anything copied, cut or selected to be sent to primary register
set clipboard=unnamed
" disable cursor navigation, to help me stick to hjkl :)
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

