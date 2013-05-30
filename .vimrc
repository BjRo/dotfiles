set nocompatible

" Fire up pathogen
call pathogen#infect()

syntax on
filetype plugin indent on

let mapleader = ","

colorscheme railscasts

" encodings
set encoding=utf-8
set fileencoding=utf-8

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

"toogle search highlighting
nnoremap <F3> :set hlsearch!<CR>

"toogle paste mode
nnoremap <F2> :set paste!<CR>

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
set foldlevel=1         "fold 1 indent

set wildmode=full           "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"dont continue comments when pushing o/O
set formatoptions-=o

"use decimal number format for auto-increment/-decrement
set nrformats=

if has("autocmd")
  autocmd BufNewFile,BufRead Gemfile,Thorfile,Guardfile,Rakefile set filetype=ruby
  autocmd BufWritePre *.rb,*.js,Gemfile,Thorfile,Guardfile,Rakefile,.vimrc,.gitconfig :%s/\s\+$//e
  autocmd BufNewFile,BufRead *.hbs set filetype=html
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
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'

" Highlight trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Autocompletion
set infercase
highlight Pmenu ctermbg=grey ctermfg=black gui=bold

" http://connermcd.com/blog/2012/10/01/extending-vim%27s-text-objects/
let pairs = { ":" : ":",
            \ "." : ".",
            \ "/" : "/",
            \ '\|' : '\|',
            \ "*" : "*",
            \ "-" : "-",
            \ "_" : "_" }

for [key, value] in items(pairs)
  exe "nnoremap ci".key." T".key."ct".value
  exe "nnoremap ca".key." F".key."cf".value
  exe "nnoremap vi".key." T".key."vt".value
  exe "nnoremap va".key." F".key."vf".value
  exe "nnoremap di".key." T".key."dt".value
  exe "nnoremap da".key." F".key."df".value
  exe "nnoremap yi".key." T".key."yt".value
  exe "nnoremap ya".key." F".key."yf".value
endfor

" Folds
nnoremap <Leader>z zMzvzz
nnoremap <Leader><Enter> za
vnoremap <Leader><Enter> za'

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

" Syntastic
let syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['javascript'], 'passive_filetypes': ['ruby', 'css'] }

" Testing (Ruby & JS tests)
nmap <Leader>t <Plug>RubyTestRun
nmap <Leader>] <Plug>RubyFileRun
nmap <Leader>lt <Plug>RubyTestRunLast
nmap <Leader>T :call RunTestFile()<cr>
let g:rubytest_cmd_spec = "bundle exec rspec %p"
let g:rubytest_cmd_example = "bundle exec rspec %p -l %c"
let g:jasmine_use_templates=""

" Shortcuts for common vim operations
map <Leader>s :w<CR>
map <Leader>q :q!<CR>

function! RunTestFile(...)
    let in_jasmine = match(expand("%"), "Spec.js$") != -1
    if in_jasmine
      execute "JasmineRedGreen"
    else
      execute "normal \<Plug>RubyFileRun"
    end
endfunction

" Command-T
nmap <Leader>n  :CommandT<CR>
nmap <leader>m  :CommandTBuffer<CR>
nmap <leader>v  :CommandTJump<CR>
nmap <leader>c  :CommandTTag<CR>

" ctags
:nnoremap <F5> :!ctags -R<CR>

" Splits
set wmw=0
set splitright

" Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Quick split resizing
noremap <leader>j <C-W>j<C-W>_
noremap <leader>k <C-W>k<C-W>_

" Pasting below or above the current line in normal mode
:nmap <leader>p :pu<CR>
:nmap <leader>P :pu!<CR>

" Machine dependend extension for vimrc
source ~/.vimrc.local
