"  =============================================================================
"                                 LOAD PLUGINS
"  =============================================================================

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'shefaet/libnlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-abolish'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'junegunn/fzf.vim'
Plugin 'SWIG-syntax'

call vundle#end()

" =============================================================================
"                                  OPTIONS
" =============================================================================

" Color scheme
colorscheme Tomorrow-Night
set background=dark
let g:airline_theme = 'tomorrow'  " Airline color theme
let g:rehash256 = 1
set t_Co=256
let g:NERDTreeDirArrows=0
set clipboard^=unnamedplus

" Tab completion
let g:SuperTabDefaultCompletionType = "context"
set complete-=i                 " Do not search included files

" Better auto-closing braces
let delimitMate_expand_cr = 1

" General
filetype plugin indent on
set nocompatible                " Do not try to be compatible with vi
set backspace=indent,eol,start  " Ensure backspace does the right thing
set cc=80                       " Highlight the 80th column
set cursorline                  " Highlight cursor line
set encoding=utf-8              " Display encoding
set fileencoding=utf-8          " File encoding
set laststatus=2                " For airline to work with one pane
set mouse=a                     " Enable mouse in terminal
set makeprg=waf                 " Use waf for making most projects
set noswapfile                  " Backups are for sissies
set number                      " Number lines
set ruler                       " Turn on the ruler
set tags=tags;                  " Automatically read tags file
set wildmenu                    " Show popup list during autocompletion
set wildmode=list:longest,full
syntax enable                   " Enable syntax higlighting

" Fix mouse in tmux
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Indentation options
set autoindent                  " Turn on auto indentation
set cino=N-s,g0.5s,h0.5s,(0     " Cindent options
set expandtab                   " Expand tabs to spaces
set formatoptions=tcqron        " Formatting options
set shiftwidth=4                " Set the indent width
set softtabstop=4               " 1 tab expanded to 4 spaces
set tabstop=8                   " 1 tab shown as 8 spaces
set textwidth=80                " Max textwidth

" Search options
set ignorecase                  " Be smart about case-sensitivity in search
set incsearch                   " Allow incremental search (as-you-type)
set smartcase                   " Smart case insensitive search
set nohlsearch                  " Turn off search highlighting

" Mac-specific clipboard settings
if has("unix")
    if system("uname") =~ "Darwin"
        set clipboard=unnamed
    endif
endif

" =============================================================================
"                              CUSTOM MAPPINGS
" =============================================================================

" Easily switch to normal mode (and save)
inoremap jk  <Esc>

" Easily switch between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let mapleader=","

" Remove trailing spaces
nnoremap <Leader>s :%s/\s\+$//<CR><C-o>

" Open NERDTree window
nnoremap <Leader>a :NERDTreeTabsToggle<CR>
let NERDTreeHijackNetrw = 1

" Run make
nnoremap <Leader>m :make<CR>

" Save the buffer
nnoremap <Leader>w <Esc>:w<CR>

" =============================================================================
"                               AUTO COMMANDS
" =============================================================================

" Highlight wscripts as python
autocmd BufRead,BufNewFile wscript set filetype=python

" Adding support for doxygen-style comments
autocmd Filetype c,cpp set comments^=:///

" Default to Github-flavored markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
