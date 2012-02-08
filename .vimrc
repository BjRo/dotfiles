" Fire up pathogen
call pathogen#infect()

syntax on
filetype on
filetype plugin indent on

let mapleader = "," 

" No arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" VIM mode
set nocompatible

" No backup and swap files
set nobackup
set noswapfile

" Tab settings
set noexpandtab     " Tabs
set tabstop=4       " A tab is two colums
set softtabstop=4   " Amount of columns for backspace
set shiftwidth=4    " Amount of columns for indentation in n mode

if has("autocmd")
  autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType xml        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType markdown   setlocal ts=2 sts=2 sw=2 expandtab
end

set autoindent 
set ai
set wildmode=list:longest
set foldcolumn=2
set number
set nowrap
set showmatch
set mat=5
set ignorecase
set smartcase

set laststatus=2 

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Highlight trailing spaces
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/	
highlight ExtraWhitespace ctermbg=DarkRed

if has("gui_running")
  call togglebg#map("<F5>")

  " clipboard integration
  set clipboard=unnamed

  set encoding=utf-8
  set guifont=Consolas:h16

  " Turn of menu and toolbar
  set guioptions-=T        
  set guioptions-=m       

  " Use the solarized theme
  colorscheme solarized     
  set background=dark
  let g:solarized_contrast="high"
  let g:solarized_visibility="high" 
end

" Visualize eof and tabs
set listchars=tab:▸\ ,eol:¬ 
nmap <leader>l :set list!<CR>

" leader u shows gundo
nmap <leader>u :GundoToggle<CR>

" Configuration for NERDTree
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let g:NERDTreeMapOpenVSplit = "C-v"
let g:NERDTreeMapOpenSplit  = "C-s"

" List of most recently used files
nmap <leader>m :TRecentlyUsedFiles<CR>

" Ruby tests
nmap <Leader>t <Plug>RubyTestRun     
nmap <Leader>T <Plug>RubyFileRun     
nmap <Leader>lt <Plug>RubyTestRunLast 

" ctrlp navigation
nmap <Leader>n  :CtrlP<CR>

" Machine dependend extension for vimrc
source ~/.vimrc.local
