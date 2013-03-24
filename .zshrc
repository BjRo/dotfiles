# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="frontcube"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
plugins=(git brew)

# Make osx lion able to open up a tab in the same directory (again)
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

source $ZSH/oh-my-zsh.sh

# UTF-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path exports
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Editors
export BUNDLER_EDITOR=vim
export EDITOR=vim

#Use gcc instead of LLVM
export CC=gcc-4.2
export CXX=g++-4.2

# TMUX
alias tmux="TERM=screen-256color-bce tmux"
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

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

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
unsetopt auto_name_dirs

source ~/.zshrc.local
