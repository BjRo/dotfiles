" Fire up pathogen
call pathogen#infect()

syntax on
filetype on
filetype plugin indent on

let mapleader = ","

colorscheme railscasts

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

" Launch shells in interactive mode
set shellcmdflag=-ic

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

" Indicates a fast terminal connection. More characters will be sent to the
" screen for redrawing, instead of using insert/delete line commands.
set ttyfast

" Search for the word under the cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

if has("autocmd")
  autocmd FileType html,css,xml,ruby,yaml setlocal autoindent ts=2 sts=2 sw=2 expandtab
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
  " Turn of menu and toolbar
  set guioptions-=T        
  set guioptions-=m       
end

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

" ctrlp (TODO: Switch back to ctrl-t)
nmap <Leader>n  :CtrlP<CR>
let g:ctrlp_working_path_mode = 0

" Machine dependend extension for vimrc
source ~/.vimrc.local
