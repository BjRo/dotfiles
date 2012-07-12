set nocompatible
set term=screen-256color

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
set noexpandtab     " Tabs
set tabstop=4       " A tab is two colums
set softtabstop=4   " Amount of columns for backspace
set shiftwidth=4    " Amount of columns for indentation in n mode

" don't give the intro message when starting Vim :intro.
set shortmess+=I

" All the windows are automatically made the same size after
" splitting or closing a window
set equalalways

" Splitting a window will put the new window right of the current one
set splitright

" enable the use of the mouse in terminals
set mouse=a ttymouse=xterm2

" show the matched parenthesis for 0.3 seconds
set showmatch matchtime=3
highlight MatchParen ctermbg=white

" Indicates a fast terminal connection. More characters will be sent to the
" screen for redrawing, instead of using insert/delete line commands.
set ttyfast

if has("autocmd")
  autocmd FileType html,css,xml,ruby,yaml setlocal autoindent ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead Gemfile,Thorfile,Guardfile set filetype=ruby
end

set autoindent
set ai
set wildmode=list:longest
set foldcolumn=2
set number
set ruler
set nowrap
set showmatch
set mat=5
set ignorecase
set smartcase
set laststatus=2 

if has("gui_running")
  " Turn of menu and toolbar
  set guioptions-=T
  set guioptions-=m
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
highlight Pmenu ctermbg=238 gui=bold

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Shortcut for expanding to the directory of the currently displayed file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Shortcut for expanding to full filename of the currently displayed file
cnoremap $$ <C-R>=expand('%')<cr>

" leader u shows gundo
nmap <leader>u :GundoToggle<CR>

" Configuration for NERDTree
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let g:NERDTreeMapOpenVSplit = "C-v"
let g:NERDTreeMapOpenSplit  = "C-s"
let g:NERDTreeDirArrows=0

" List of most recently used files
nmap <leader>m :TRecentlyUsedFiles<CR>

" Ruby tests
nmap <Leader>t <Plug>RubyTestRun
nmap <Leader>T <Plug>RubyFileRun
nmap <Leader>lt <Plug>RubyTestRunLast 

" ctrlp
nmap <Leader>n  :CtrlP<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" Changing splits
set wmw=0
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Machine dependend extension for vimrc
source ~/.vimrc.local
