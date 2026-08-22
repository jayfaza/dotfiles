#
# ~/.bash_profile
#
# Auto-start Hyprland only on TTY1
 if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec niri-session -l
 fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
