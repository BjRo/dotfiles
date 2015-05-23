set nocompatible

" Fire up pathogen
call pathogen#infect()

syntax on
filetype plugin indent on

let mapleader = ","

colorscheme railscasts

"let g:solarized_termcolors=256
"colorscheme solarized
"set background=light

" Set the tab title in iterm automatically
silent execute '!printf "\e]1;$(basename `pwd`)\a"'
auto VimLeave * :!printf "\e]1;bash\a"

" setup powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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
set fillchars+=stl:\ ,stlnc:\       " Configure Powerline
set noshowmode
set ambiwidth=single

let NERDTreeChDirMode=2
let g:NERDTreeDirArrows=0
let syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['javascript'], 'passive_filetypes': ['ruby', 'css'] }
let g:rubytest_cmd_spec = "bundle exec rspec %p"
let g:rubytest_cmd_example = "bundle exec rspec %p -l %c"
let g:jasmine_use_templates=""
let g:Powerline_symbols = 'fancy'

if has("autocmd")
  " Kill all the whitespace
  autocmd BufWritePre *.ex,*.exs,*.rb,*.js,Gemfile,Thorfile,Guardfile,Rakefile,.vimrc,.gitconfig :%s/\s\+$//e

  " File recognition
  autocmd BufNewFile,BufRead Gemfile,Thorfile,Guardfile,Rakefile set filetype=ruby
  autocmd BufNewFile,BufRead *.hbs set filetype=html
end

if has("gui_running")
  " Turn of menu and toolbar
  set guioptions-=T
  set guioptions-=m
  set guifont=Source\ Code\ Pro\ for\ Powerline:h16
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
nmap <Leader>n  :CommandT<CR>
nmap <leader>m  :CommandTBuffer<CR>
nmap <leader>v  :CommandTJump<CR>
nmap <leader>c  :CommandTTag<CR>
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

" Shortcut for expanding to the directory of the currently displayed file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Shortcut for expanding to full filename of the currently displayed file
cnoremap $$ <C-R>=expand('%')<CR>

" Yankstack bindings
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

" Machine dependend extension for vimrc
source ~/.vimrc.local

set noeb
set novb
