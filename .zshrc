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
alias novent="sudo dell-bios-fan-control 0 ; sudo i8kctl fan1 0 ; sudo i8kctl fan2 0"
alias vent="sudo dell-bios-fan-control 0 ; sudo i8kctl fan1 2 ; sudo i8kctl fan2 2"
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
alias hhxx='hx "$(fd . -H --type file | fzf)"'
alias hxx='cd ~ ; hhxx'
alias delphine="feh --no-fehbg --bg-fill '/home/malo/.dotfiles/.config/leftwm/themes/Himmel/Backgrounds/moche.jpg'"
alias wod="feh --no-fehbg --bg-fill '/home/malo/.dotfiles/.config/leftwm/themes/Himmel/Backgrounds/wod.png'"
alias webserver="sudo quark -p 1234 -g malo -u malo"
alias cat="bat -p"

listen() {
  # Executing with a separate bash process inside a script file
  # for the trap to work

  SCRIPT_PATH=$(mktemp)
  cat >"$SCRIPT_PATH" <<EOF
  trap "trap - SIGTERM && kill -- -\$$" SIGINT SIGTERM EXIT

  sh -c "\$2" &
  MY_PID="\$!"

  while inotifywait -r -qq -e close_write,move_self,delete_self \$1
  do
    kill "\$MY_PID"
    wait "\$MY_PID"
    clear
    sh -c "\$2" &
    MY_PID="\$!"
  done
EOF

  bash "$SCRIPT_PATH" $@
}
# listen() {
#   if [ $# -lt 2 ]; then
#     printf 'Usage: listen <path> "<command>"\n' >&2
#     return 2
#   fi

#   _listen_pid=

#   _listen_cleanup() {
#     trap - INT TERM EXIT
#     if [ -n "$_listen_pid" ]; then
#       kill -TERM -- -"$_listen_pid" 2>/dev/null
#       wait "$_listen_pid" 2>/dev/null
#     fi
#   }

#   trap '_listen_cleanup' INT TERM EXIT

#   # Run command in its own process group so children get signaled too
#   setsid sh -c "$2" &
#   _listen_pid=$!

#   while inotifywait -r -qq -e close_write,move_self,delete_self $1
#   do
#     clear
#     kill -TERM -- -"$_listen_pid" 2>/dev/null
#     echo Waiting for previous instance to stop...
#     wait "$_listen_pid" 2>/dev/null
#     clear
#     setsid sh -c "$2" &
#     _listen_pid=$!
#   done
# }

hfax() {
  filename=$(basename -- "$1")
  extension="${filename##*.}"
  filename="${filename%.*}"
  API_PATH="https://faxer.heav.fr/api/file/random.${extension}"
  hash=$(gsutil hash -m "$1" 2>/dev/null | grep md5 | awk '{ printf $3 }')
  size=$(stat --printf="%s" "$1")

  content_type="application/octet-stream"

  output=$(curl "${API_PATH}" \
    -H 'content-type: application/json' \
    --data-raw "{\"file_hash\":\"${hash}\",\"mime_type\":\"$content_type\",\"file_size\":$size}" \
    2>/dev/null
  )
  echo Link: https://hfax.fr/f/$(echo "$output" | jq -r '.name')

  if echo "$output" | grep '"success":false' &> /dev/null
  then
    echo $(echo "$output" | jq -r '.message')
    return
  fi
  if echo "$output" | grep already_known &> /dev/null
  then
    return
  fi
  
  echo "$output"
  upload_url=$(echo "$output" | jq -r '.upload_url')
  echo \'$upload_url\'

  curl "$upload_url" \
    -X 'PUT' \
    -H "content-length: $size" \
    -H "content-md5: $hash" \
    -H "content-type: $content_type" \
    --data-binary @"$1"
}

mkcd() {
  mkdir -p $1
  cd $1
}

function title {
  echo -en "\033]0;$@\a"
}
preexec() {
  title $1
}
precmd () {
  title zsh
}
# precmd_functions+=(set_win_title)
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

# fly.io
export FLYCTL_INSTALL="/home/malo/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Nodejs globals
export PATH="$(npm root -g):$PATH"

[ -f "/home/malo/.ghcup/env" ] && source "/home/malo/.ghcup/env" # ghcup-env

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"

mkdir -p /tmp/tmp-dev

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export ENCORE_INSTALL="/home/malo/.encore"
export PATH="$ENCORE_INSTALL/bin:$PATH"

export GITHUB_NPM_REGISTRY_TOKEN=$(cat ~/.github_npm_registry_token)

# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_ZSH_SETUP_PATH=/home/malo/.cache/@asyncapi/cli/autocomplete/zsh_setup && test -f $ASYNCAPI_AC_ZSH_SETUP_PATH && source $ASYNCAPI_AC_ZSH_SETUP_PATH; # asyncapi autocomplete setup


