#!/usr/bin/env bash

# $1: option, $2: value
tmux_set() {
  tmux set-option -gq "$1" "$2"
}

session_icon="󰪥"
window_separator_icon=""
time_format='%0l:%M %p'
date_format='%b %d'
date_icon="󰃰"

# short for Theme-Colour
FG=#b4befe
G07=#55587a
BG=#1e1e2e
FC=#ff7b72

# Status options
tmux_set status-interval 1
tmux_set status on

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "$BG"
tmux_set status-attr none

# tmux-prefix-highlight
tmux_set @prefix_highlight_fg "$BG"
tmux_set @prefix_highlight_bg "$FG"
tmux_set @prefix_highlight_show_copy_mode 'on'
tmux_set @prefix_highlight_show_sync 'on'
tmux_set @prefix_highlight_copy_mode_attr "fg=$BG,bg=$FG,bold"
tmux_set @prefix_highlight_output_prefix "#[fg=$BG]#[bg=$FG] "
tmux_set @prefix_highlight_output_suffix "#[fg=$BG]#[bg=$FG] "

# Left side of status bar
LS="#[fg=$BG,bg=$FG] $session_icon #S #[fg=$FG]"
tmux_set status-left-length 150
tmux_set status-left "$LS"

# Right side of status bar
RS="$time_format #[fg=$FG]"
RS="#[fg=$FG] $date_icon $date_format $RS"
RS="#{prefix_highlight}$RS"
tmux_set status-right-length 150
tmux_set status-right "$RS"

# Window status
tmux_set window-status-format "#[fg=$FG,bg=$BG] #I:#W#F "
tmux_set window-status-current-format "#[fg=$FG] #[fg=$FC,bold]#I:#W#F "

# Window separator  󰫣
tmux_set window-status-separator "$window_separator_icon"

# Window status alignment
tmux_set status-justify left

# Current window status
tmux_set window-status-current-style "fg=$FG,bg=$BG"

# Pane border
tmux_set pane-border-style "fg=$G07,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$FG,bg=$BG"

# Pane number indicator
tmux_set display-panes-colour "$G07"
tmux_set display-panes-active-colour "$FG"

# Clock mode
tmux_set clock-mode-colour "$FG"
tmux_set clock-mode-style 24

# Message
tmux_set message-style "fg=$FG,bg=$BG"

# Command message
tmux_set message-command-style "fg=$FG,bg=$BG"

# Copy mode highlight
tmux_set mode-style "bg=$FG,fg=$BG"
