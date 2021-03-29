" General 

set linebreak			" Break lines at word (requires Wrap lines) 
set number                      " Show line numbers
set showbreak=+++		" Wrap-broken line prefix 
set textwidth=85		" Line wrap (number of cols) 
set showmatch			" Highlight matching brace 
set visualbell			" Use visual bell (no beeping) 
set hlsearch			" Highlight all search results
set smartcase			" Enable smart-case search
set ignorecase			" Always case-insensitive
set incsearch			" Searches for strings incrementally
 
set autoindent			" Auto-indent new lines
set expandtab			" Use spaces instead of tabs
set shiftwidth=4		" Number of auto-indent spaces
set smartindent			" Enable smart-indent
set smarttab			" Enable smart-tabs
set softtabstop=4		" Number of spaces per Tab
 
set ruler			" Show row and column ruler information
set undolevels=1000		" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour


" Automatically install vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim-plug plugins

call plug#begin('~/.vim/vim-plug-plugins')

Plug 'tpope/vim-surround'

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-commentary'

Plug 'preservim/nerdtree'

Plug 'airblade/vim-gitgutter'

Plug 'fatih/vim-go'

Plug 'terryma/vim-multiple-cursors'

Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf.vim'

Plug 'arcticicestudio/nord-vim'

Plug 'valloric/youcompleteme'

Plug 'majutsushi/tagbar'

Plug 'sheerun/vim-polyglot'

call plug#end()


" key mappings

" Toggle nerd tree
map <C-t> :NERDTreeToggle<CR>

" Open fzf fuzzy search
map <C-p> :Files<CR>

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>


" lightline configuration
set laststatus=2
set noshowmode
if !has('gui_running')
    set t_Co=256
endif

syntax on
colorscheme nord

