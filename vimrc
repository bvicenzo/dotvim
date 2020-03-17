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
Plugin 'kien/ctrlp.vim'
Plugin 'pechorin/any-jump.vim'
" Analyzing
Plugin 'majutsushi/tagbar'
Plugin 'dense-analysis/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'sheerun/vim-polyglot'
" Commenter
Plugin 'scrooloose/nerdcommenter'
" Documentation Generation
Plugin 'kkoomen/vim-doge'
" Refactoring
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'terryma/vim-multiple-cursors' " Tutorial: https://www.youtube.com/watch?v=YwMgnmZNWXA
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

" Programming Languages
" html
"" HTML Bundle
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plugin 'jelera/vim-javascript-syntax'


" ruby
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-projectionist'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'victormours/ruby-memoize.vim'


" scala
if has('python')
    " sbt-vim
    Plugin 'ktvoelker/sbt-vim'
endif
" vim-scala
Plugin 'derekwyatt/vim-scala'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General Configuration

" Change leader key
let mapleader=","

" Line numbers
set nu!

" don't break wrapped lines on words
set linebreak

" set no word rap line
set nowrap

" Intuitive backspacing
set backspace=indent,eol,start

" use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

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

" Ruby debugger
map <leader>rdb orequire 'pry'; binding.pry<ESC>:w<CR>

" run the above commands only if vim is compiled with autocmd
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC " apply .vimrc settings on save
  autocmd BufWritePre *.rb,*.erb,*.html,*.js,*.css,*.php,*.py,*.json :call <SID>StripTrailingWhitespaces() " remove trailing white spaces before saving (only in specified filetypes)
endif

" function to remove trailing white space (while saving cursor position)
" http://vimcasts.org/episodes/tidying-whitespace/

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

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
" switch to last used buffer
let g:bufExplorerShowRelativePath=1
nnoremap <leader>l :e#<CR>
set hidden " Allow Bufer Explorer to change opened files without saving (http://vimcasts.org/transcripts/6/en/)

" Taggbar
map <leader>tb :TagbarToggle<CR>

" Fugitive
map <leader>gb :Gblame<CR>
map <leader>of :Gbrowse<CR>
" Open current line on GitHub
nnoremap <Leader>ol :.Gbrowse<CR>
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" ale
let g:ale_linters = {}
let g:ale_list_window_size = 3
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

" Ctrlp
" List all files with a patern
nnoremap <leader>p :CtrlP<CR>

" List all files with a patern in buffer
nnoremap <leader>P :CtrlPBuffer<CR>

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>ls :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" For ruby refactory
if has('nvim')
  runtime! macros/matchit.vim
else
  packadd! matchit
endif

" Ruby refactory
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>
