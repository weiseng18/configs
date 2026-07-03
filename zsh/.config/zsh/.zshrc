# -------------------------------------------------------------------- env vars
export REPOS=$HOME/repos
export DOTS=$REPOS/configs
export ZSH_DOTS=$DOTS/zsh/.config/zsh

export NAVI_PATH=$DOTS/navi

# man page
export EDITOR=nvim
export LESSHISTFILE=-
[ $EDITOR = "nvim" ] && export MANPAGER="nvim +Man!"

# git-number
export PATH="$(go env GOPATH)/bin:$PATH"

# ---------------------------------------------------------------- app specific

# fzf fuzzy autocompletion and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Keybindings
# CTRL+R for fzf auto completion
# CTRL+G for navi

# ---------------------------------------------------------------------- locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# -------------------------------------------------------------------- features
source $ZSH_DOTS/git
source $ZSH_DOTS/misc
source $ZSH_DOTS/oneliners
source $ZSH_DOTS/nav
source $ZSH_DOTS/prompt

# --------------------------------------------------------------- shell options

setopt globdots # enable zsh completion to show hidden files and folders
set -o ignoreeof # help with accidental control-D

# enable zprof
zmodload zsh/zprof
