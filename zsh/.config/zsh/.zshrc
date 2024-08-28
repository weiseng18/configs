# -------------------------------------------------------------------- env vars
export REPOS=$HOME/repos
export DOTS=$REPOS/configs
export ZSH_DOTS=$DOTS/zsh/.config/zsh

export NAVI_PATH=$DOTS/navi

# man page
export EDITOR=nvim
export LESSHISTFILE=-
[ $EDITOR = "nvim" ] && export MANPAGER="nvim +Man!"

# cs2103t
source "$HOME/.sdkman/bin/sdkman-init.sh"

# jdtls-launcher
export PATH=$PATH:$HOME/.local/bin

# setup matlab
export PATH="/Applications/MATLAB_R2022b.app/bin/:$PATH"

# LaTeX
export MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH"
export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"

export PATH="/usr/local/texlive/2024/texmf-dist/tex/latex/:$PATH"

# ---------------------------------------------------------------- app specific
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

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

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/kurumi/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
