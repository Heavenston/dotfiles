#!/bin/nu

def info [m] {
  print $m
  notify-send -t 1000 "Tablet Mode" $m
}

def ctl [...args] {
  hyprctl ...$args | complete
}

if ("/tmp/himmel_tablet_mode" | path exists) {
  ctl reload
  rm /tmp/himmel_tablet_mode

  info "Disabled"
  exit 0
}

touch /tmp/himmel_tablet_mode

ctl keyword workspace "w[tv1], gapsout:4, gapsin:2"
ctl keyword workspace "f[1], gapsout:4, gapsin:2"
ctl keyword windowrule "match:float false, match:workspace w[tv1], border_size 2, rounding 2"
ctl keyword windowrule "match:float false, match:workspace f[1], border_size 2, rounding 2"

ctl keyword monitor 'eDP-1,preferred,auto,2'

ctl keyword plugin:hyprbars:enabled true
ctl keyword general:layout dwindle
ctl keyword animations:enabled true

info "Enabled"
exit
