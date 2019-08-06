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
" Buffer
Plugin 'corntrace/bufexplorer'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General Configuration

" Line numbers
set nu!

" Change leader key
let mapleader=","

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

" Plugins Configuration

" AirLine
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1

" Dracula
syntax on
" Fix broken colorscheme (see https://github.com/dracula/vim/issues/65#issuecomment-377496609)
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

" NerdTree
map <leader>nt :NERDTreeToggle<CR>

" bufferexplorer

nnoremap <leader>l :e#<CR>          " switch to last used buffer
