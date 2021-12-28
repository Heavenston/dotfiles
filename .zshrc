# ~/.zshrc

# If not running interactively, don't do anything
# Probably useless since zsh only loads this file if in interactive mode
[[ $- != *i* ]] && return

alias vim="nvim"
alias ls="exa -lF --icons --sort type"
alias lsa="ls -a"

eval "$(starship init zsh)"

# Enable auto completion
autoload -Uz compinit
compinit

# Vim keybindings !
bindkey -v

export HISTFILE=~/.histfile
export HISTSIZE=5000
export SAVEHIST=10000
setopt appendhistory

export PATH=$PATH:"$HOME/.cargo/bin"
export EDITOR="vim"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval $(opam env)

export PATH=/home/malo/.config/dmenu-entries:$PATH
