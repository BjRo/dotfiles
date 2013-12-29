# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="macovsky"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
plugins=(git brew)

source $ZSH/oh-my-zsh.sh

# UTF-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path exports
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/lib/node_modules:$PATH
export PATH=$PATH:$HOME/.rvm/bin

# Editors
export BUNDLER_EDITOR=vim
export EDITOR=vim

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
alias fuckit='git clean -d -x -f; git reset --hard'

# Bundler shortcuts
alias be="bundle exec"
alias bi="bundle install"
alias bo="bundle open"
alias rake="noglob rake"
alias lein="nocorrect lein"

#general unix functionality
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias ls="ls -aF"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
unsetopt auto_name_dirs

# Disable zsh autocorrection
unsetopt correct_all

source ~/.zshrc.local
