set nocompatible

" Fire up pathogen
call pathogen#infect()

syntax on
filetype plugin indent on

let mapleader = ","

colorscheme railscasts

" No backup and swap files
set nobackup
set noswapfile

" Ensure that shell with environment vars is loaded
set shell=/bin/sh

" clipboard integration
set clipboard^=unnamed

" Tab settings
set expandtab       " Spaces instead of tabs
set tabstop=2       " A tab is two colums
set softtabstop=2   " Amount of columns for backspace
set shiftwidth=2    " Amount of columns for indentation in n mode

" don't give the intro message when starting Vim :intro.
set shortmess+=I

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

" enable the use of the mouse in terminals
set mouse=a ttymouse=xterm2

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

"toogle search highlighting
nnoremap <F3> :set hlsearch!<CR>

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

" Indicates a fast terminal connection. More characters will be sent to the
" screen for redrawing, instead of using insert/delete line commands.
set ttyfast

" 256 colors in terminal
set term=screen-256color
set t_Co=256

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=full           "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"dont continue comments when pushing o/O
set formatoptions-=o

"use decimal number format for auto-increment/-decrement
set nrformats=

if has("autocmd")
  autocmd BufNewFile,BufRead Gemfile,Thorfile,Guardfile,Rakefile set filetype=ruby
  autocmd BufWritePre *.rb,Gemfile,Thorfile,Guardfile,Rakefile,.vimrc,.gitconfig :%s/\s\+$//e
end

set autoindent
set ai
set wildmode=list:longest
set number
set ruler
set showmatch
set mat=5
set ignorecase
set smartcase
set laststatus=2
set vb

if has("gui_running")
  " Turn of menu and toolbar
  set guioptions-=T
  set guioptions-=m
  set guifont=Menlo:h16
end

" Configure Powerline
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Highlight trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
highlight Pmenu ctermbg=grey ctermfg=black gui=bold

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Shortcut for expanding to the directory of the currently displayed file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Shortcut for expanding to full filename of the currently displayed file
cnoremap $$ <C-R>=expand('%')<cr>

" Paste mode toggle
noremap !! :set paste!<CR>

" leader u shows gundo
nmap <leader>u :GundoToggle<CR>

" Configuration for NERDTree
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let g:NERDTreeMapOpenVSplit = "C-v"
let g:NERDTreeMapOpenSplit  = "C-s"
let g:NERDTreeDirArrows=0

" Ruby tests
nmap <Leader>t <Plug>RubyTestRun
nmap <Leader>T <Plug>RubyFileRun
nmap <Leader>lt <Plug>RubyTestRunLast
let g:rubytest_cmd_spec = "bundle exec rspec %p"
let g:rubytest_cmd_example = "bundle exec rspec %p -l %c"

" Command-T
nmap <Leader>n  :CommandT<CR>
nmap <leader>m  :CommandTBuffer<CR>
nmap <leader>v  :CommandTJump<CR>
nmap <leader>c  :CommandTTag<CR>

" ctags
:nnoremap <F5> :!ctags -R<CR>

" Changing splits
set wmw=0
set splitright
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>j <C-W>j<C-W>_
noremap <leader>k <C-W>k<C-W>_

" Fake '|' as text object
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" Fake '/' as text object
nnoremap di/ T/d,
nnoremap da/ F/d,
nnoremap ci/ T/c,
nnoremap ca/ F/c,
nnoremap yi/ T/y,
nnoremap ya/ F/y,
nnoremap vi/ T/v,
nnoremap va/ F/v,

" Pasting below or above the current line in normal mode
:nmap <leader>p :pu<CR>
:nmap <leader>P :pu!<CR>

" Machine dependend extension for vimrc
source ~/.vimrc.local
