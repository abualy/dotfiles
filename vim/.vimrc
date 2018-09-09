" VIM Configuration
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
" Show matching parenthesis/bracket
set showmatch

" -- Search
set ignorecase " Ignore case when searching
set smartcase " If there is an uppercase in your search term
" search case sensitive again
set incsearch " Highlight search results when typing
set hlsearch " Highlight search results
" Search down into subfolders
set path+=**
" Display all matching files when using tab complete
set wildmenu

" -- Beep
set visualbell " Prevent Vim from beeping
set noerrorbells " Prevent Vim from beeping

" -- Editing Behaviour
" Backspace behaves as expected
set backspace=indent,eol,start
" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden
" Enable syntax highlighting
syntax enable
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
" Create ctags to allow jumping between tags
command! MakeTags !ctags -R

" -- Accessibility
" Add paste toggle, so when pasting code, deactiavte auto indenting
set pastetoggle=<F2>
" Add anything copied, cut or selected to be sent to primary register
set clipboard=unnamed
" disable cursor navigation for normal mode, to help me stick to hjkl :)
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
" disable cursor navigation for insert mode now, to help me stick to hjkl :)
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
" add shortcut for autompletion from current file
imap <Tab> <C-n>
imap <s-Tab> <C-p>
" map // to search selected text
vnoremap // y/<C-R>"<CR>

" -- Plugins Management
" activate pathogen
execute pathogen#infect()
" Set NerdTree Toggle to F3
nmap <F3> :NERDTreeToggle<CR>
" add Hardtime toggle
nmap <F4> :HardTimeToggle<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
" diasble vim-go helpers, to learn more
let g:go_fmt_autosave = 0
" syntastic recommended settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" redirect Ack to Ack!
cnoreabbrev Ack Ack!
" map /// to search selected text in all files
vnoremap /// y:Ack <C-r>=fnameescape(@")<CR><CR>
