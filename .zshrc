# ~/.zshrc
source ~/.zplug/init.zsh

# ZSH Better vim mode
zplug "jeffreytse/zsh-vi-mode"

zplug load

alias vim="nvim"
alias ls="exa -lF --icons --sort type"
alias lsa="ls -a"
alias lls="/bin/ls"
alias mode="sudo cpupower frequency-set -g"
alias gsync="git stash push -u && git pull && git push && git stash pop"
alias lisp="rlwrap sbcl"
alias ca="cargo"
alias who="bash ~/init_tardis.sh"
alias hx="helix"
alias g="git"
alias coucou="echo coucou"
alias cls="clear ; "
alias vent="sudo dell-bios-fan-control 0 ; sudo i8kctl fan 2 2"
alias pasvent="sudo dell-bios-fan-control 1"

eval "$(starship init zsh)"

export HISTFILE=~/.histfile
export HISTSIZE=50000000
export SAVEHIST=100000000
setopt appendhistory
setopt histignoredups
setopt extended_glob
setopt extendedglob
setopt HIST_IGNORE_SPACE

export PATH=$PATH:"$HOME/.cargo/bin"
export EDITOR="vim"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval $(opam env)

export PATH=/home/malo/.config/dmenu-entries:$PATH

# bun completions
[ -s "/home/malo/.bun/_bun" ] && source "/home/malo/.bun/_bun"

# Bun
export BUN_INSTALL="/home/malo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Python
export PATH="/home/malo/.local/bin:$PATH"
