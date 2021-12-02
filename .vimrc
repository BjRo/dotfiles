syntax on
set nocompatible
filetype off

"<<-VIM-PLUG
call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'docunext/closetag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tyok/nerdtree-ack'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'janko-m/vim-test'
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'ngmy/vim-rubocop'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'jparise/vim-graphql'
call plug#end()
filetype plugin indent on
"VIM-PLUG

colorscheme railscasts
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=light

let mapleader = ","
set encoding=utf-8
set fileencoding=utf-8
set ttyfast
set term=screen-256color
set t_Co=256
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
set nobackup                        " No backup
set noswapfile                      " No swap files
set shell=/bin/sh                   " Ensure that shell with environment vars is loaded
set clipboard^=unnamed              " clipboard integration
set expandtab                       " Spaces instead of tabs
set tabstop=2                       " A tab is two colums
set softtabstop=2                   " Amount of columns for backspace
set shiftwidth=2                    " Amount of columns for indentation in n mode
set shortmess+=I                    " don't give the intro message when starting Vim :intro.
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set history=1000                    " store lots of :cmdline history
set mouse=a ttymouse=xterm2         " enable the use of the mouse in terminals
set incsearch                       " find the next match as we type the search
set wrap                            " don't wrap lines
set linebreak                       " wrap lines at convenient points
set foldmethod=indent               " fold based on indent
set foldnestmax=3                   " deepest fold is 3 levels
set nofoldenable                    " don't fold by default
set foldlevel=1                     " fold 1 indent
set wildmode=full                   " make cmdline tab completion similar to bash
set wildmenu                        " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~         " stuff to ignore when tab completing
set formatoptions-=o                " dont continue comments when pushing o/O
set nrformats=                      " use decimal number format for auto-increment/-decrement
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " Highlight trailing spaces
set infercase
set wmw=0
set splitright
set noshowmode
set ambiwidth=single
set noeb
set novb

"For vim-gitgutter
set updatetime=750
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

let NERDTreeChDirMode=2
let g:NERDTreeDirArrows=0

let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list= 1
let g:syntastic_auto_loc_list= 1
let g:syntastic_check_on_open= 1
let g:syntastic_check_on_wq= 0
let g:syntastic_elixir_checkers= ['elixir']
let g:syntastic_enable_elixir_checker= 1

let g:airline#extensions#tabline#enabled= 1
let g:airline_powerline_fonts= 1
let g:airline_theme='powerlineish'

if has("autocmd")
  " Kill all the whitespace
  autocmd BufWritePre *.md,*.ex,*.exs,*.rb,*.js,Gemfile,Thorfile,Guardfile,Rakefile,.vimrc,.gitconfig :%s/\s\+$//e

  " File recognition
  autocmd BufNewFile,BufRead Gemfile,Thorfile,Guardfile,Appraisals,Rakefile set filetype=ruby
  autocmd BufNewFile,BufRead *.hbs set filetype=html
end

if has("gui_running")
  " Turn of menu and toolbar
  set guioptions-=T
  set guioptions-=m
  set macmeta
end

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

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Highlight the 101 column when exceeded
highlight ColorColumn ctermbg=166
call matchadd('ColorColumn', '\%101v', 100)

nnoremap <leader><leader> <c-^>                        " Switch between the last two files
nnoremap <Leader>z zMzvzz
nnoremap <Leader><Enter> za
vnoremap <Leader><Enter> za'
nmap <leader>u :GundoToggle<CR>
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
map <Leader>s :w<CR>
map <Leader>q :q!<CR>
nmap <Leader>n  :FZF<CR>
noremap <leader>j <C-W>j<C-W>_
noremap <leader>k <C-W>k<C-W>_
noremap <C-h> <C-w>h                                    " Split navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <F3> :set hlsearch!<CR>                        " toogle search highlighting
nnoremap <F2> :set paste!<CR>                           " toogle paste mode
nnoremap <F4> :call NumberToggle()<CR>
nnoremap <F5> :!ctags -R<CR>                            " ctags

" vim-test bindings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>lt :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Move between changed areas
nmap <leader>h <Plug>GitGutterNextHunk
nmap <leader>H <Plug>GitGutterPrevHunk

" Shortcut for expanding to the directory of the currently displayed file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Shortcut for expanding to full filename of the currently displayed file
cnoremap $$ <C-R>=expand('%')<CR>

" Yankstack bindings
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

" Machine dependend extension for vimrc
source ~/.vimrc.local
