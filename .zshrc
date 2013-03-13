# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="frontcube"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew)

# Make osx lion able to open up a tab in the same directory (again)
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/Coding/Scripts:$PATH

# Default editor for bundler
export BUNDLER_EDITOR=vim

#Use gcc instead of LLVM
export CC=gcc-4.2
export CXX=g++-4.2

# TMUX
alias tmux="TERM=screen-256color-bce tmux"

#CDPATH
export CDPATH=.:~:~/Coding/Laboratory/

# git shortcuts
alias g='git'
alias co='git checkout'
alias st='git status'
alias br='git branch'
alias br='git branch'
alias pull='git pull'
alias push='git push'

# Bundler shortcuts
alias be="bundle exec"
alias bi="bundle install"
alias bo="bundle open"
alias rake="noglob rake"
alias lein="nocorrect lein"
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.nuget/bin # Add nuget to PATH
