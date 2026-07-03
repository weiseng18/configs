if [ -r ~/.config/zsh/.zshrc ]; then
    source ~/.config/zsh/.zshrc
fi

# uv auto completions
autoload -Uz compinit
compinit
eval "$(uv generate-shell-completion zsh)"
