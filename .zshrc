# ~/.zshrc

export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source ~/.zplug/init.zsh

zplug "jeffreytse/zsh-vi-mode"

zplug load

alias vim="nvim"
alias ls="eza -l --icons --sort type"
alias lsa="ls -a"
alias lls="/bin/ls"
alias mode="sudo cpupower < /dev/null frequency-set -g"
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
alias h="history 0"
alias c="clear ; ls -a"
rebear() {
  autoreconf -i && \
  rm -rf build && \
  mkdir build && \
  cd build && \
  ../configure CFLAGS='-g3 -O0 -D_DEBUG' && \
  cd .. && \
  bear -- make -C build -kj
}
recheck() {
  autoreconf -i && \
  rm -rf build && \
  mkdir build && \
  cd build && \
  ../configure CFLAGS='-g3 -O0' && \
  cd .. && \
  make all -C build -sj && \
  make check -C build -s
}
rebuild() {
  make clean -s && clear && make -ksj && clear
}
build() {
  make -ksj && clear
}
alias check="make check"
alias ddc='cd "$(fd . -H --type directory | fzf)"'
alias dc='cd ~ ; ddc'
alias dcc=ddc
alias ddcc=ddc
alias delphine="feh --no-fehbg --bg-fill '/home/malo/.dotfiles/.config/leftwm/themes/Himmel/Backgrounds/moche.jpg'"

eval "$(starship init zsh)"

export RUSTFLAGS="-A unreachable_code"
export HISTFILE=~/.histfile
export HISTSIZE=50000000
export SAVEHIST=100000000
setopt appendhistory
setopt histignoredups
setopt extended_glob
setopt extendedglob
setopt HIST_IGNORE_SPACE
# No blob not found errors
setopt +o nullglob

export PATH=$PATH:"$HOME/.cargo/bin":"$HOME/go/bin"
export EDITOR="helix"

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
export PATH="/home/malo/.local/bin:$PATH"

# Nodejs globals
export PATH="$(npm root -g):$PATH"

[ -f "/home/malo/.ghcup/env" ] && source "/home/malo/.ghcup/env" # ghcup-env

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"
