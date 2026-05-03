# Prevent  from searching Windows
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:paths' accept-exact '*(N)'
zstyle ':completion:*' stop verbose
zstyle ':completion:*' menu select
setopt MENU_COMPLETE
# ANTIDOTE
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# Fast completion initialization
autoload -Uz compinit
for dump in ~/.zcompdump(N.m1); do
  compinit
done
compinit -C # The -C flag tells Zsh to skip security checks for speed

# ENVIRONMENT VARIABLES
export EDITOR='nvim'
export VISUAL='nvim'

export PATH=$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$PATH

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# FZF
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias lg="lazygit"

unset zle_bracketed_paste

# Modern replacements for old commands
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first"
alias cat="bat"
alias grep="rg"
alias g="git"

# Python / C++ Helpers
alias venv="python3 -m venv .venv && source .venv/bin/activate"
alias py="python3"
alias compile="g++ -O3 -Wall -Wextra"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS 
setopt SHARE_HISTORY         
# setopt AUTO_CD

if [[ ! -f ~/.zsh_plugins.txt ]]; then
    ln -s ~/dotfiles/zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
fi

. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
export UV_PYTHON="3.13"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
