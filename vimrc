set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugins
Plugin 'VundleVim/Vundle.vim'
" Themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ryanoasis/vim-devicons'
Plugin 'cj/vim-webdevicons'
Plugin 'vim-scripts/CSApprox'
" Buffer
Plugin 'corntrace/bufexplorer'
Plugin 'vim-scripts/kwbdi.vim.git'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plugin 'airblade/vim-gitgutter'
" Finding
Plugin 'rking/ag.vim'
" Analyzing
Plugin 'majutsushi/tagbar'
Plugin 'w0rp/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'sheerun/vim-polyglot'
" Commenter
Plugin 'scrooloose/nerdcommenter'
" Completion
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General Configuration

" Change leader key
let mapleader=","

" Line numbers
set nu!

" Intuitive backspacing
set backspace=indent,eol,start

" EOL format
set fileformats=unix,mac,dos

" highlight cursor line
set cursorline

" highlight matches as you type
set incsearch 

" highlight matches
set hlsearch

" show 3 lines of context around the cursor
set scrolloff=3

" ignore case while searching except if there's an uppercase letter
set ignorecase smartcase

" indent settings
set shiftwidth=2 " number of spaces used for (auto)indent
set expandtab " use soft tabs (spaces)
set softtabstop=2 " size of soft tabs
set autoindent " auto indent lines
set smartindent " smart (language based) auto indent 

" keep 100 cmdline history
set history=100

" persistent undo
set undofile
set undodir=~/.vim/tmp

" backup options
set backup " turn on backup
set backupdir=~/.vim/backup " dir to save backup files
set directory=~/.vim/tmp " dir to keep all swap files

" Encoding
set encoding=utf8

" keep window on buffer delete
nmap <silent> <leader>bd <Plug>Kwbd

" Hablitite vim for receive mouse clicks
set mouse=a

" Habilite vim yank to clipboard (it doesn't work for mac)
" Works on linux
"set clipboard=unnamedplus
" Works on Mac
set clipboard=unnamed
"
" clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" JSON Format
map <leader>jt <Esc>:%!ruby -rjson -e "print JSON.pretty_generate(JSON.parse(ARGF.read))"<ESC>=%<CR>

" XML Format
map <leader>xt <Esc>:1,$!xmllint --format -<CR>

" Plugins Configuration

" AirLine
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" Dracula
syntax on
" Fix broken colorscheme (see https://github.com/dracula/vim/issues/65#issuecomment-377496609)
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

" NerdTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
map <leader>nf :NERDTreeFind<CR>
map <leader>nt :NERDTreeToggle<CR>

" Bufferexplorer
nnoremap <leader>l :e#<CR>          " switch to last used buffer

" Taggbar
map <leader>tb :TagbarToggle<CR>

" Fugitive
map <leader>bl :Gblame<CR>
map <leader>gb :Gbrowse<CR>
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" ale
let g:ale_linters = {}
let g:ale_sign_column_always = 1
let g:ale_open_list = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Deoplete
let g:deoplete#enable_at_startup = 1

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" kwbdi
" keep window on buffer delete
nmap <silent> <leader>bd <Plug>Kwbd
