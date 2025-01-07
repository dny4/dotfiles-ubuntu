#!/usr/bin/env bash
#===============================================================================
#   Author: Wenxuan
#    Email: wenxuangm@gmail.com
#  Created: 2018-04-05 17:37
#  Customized: dny4
#===============================================================================
tmux_get() {
  local value
  value="$(tmux show -gqv "$1")"
  [ -n "$value" ] && echo "$value" || echo "$2"
}

# $1: option, $2: value
tmux_set() {
  tmux set-option -gq "$1" "$2"
}

# Options
right_arrow_icon=$(tmux_get '@tmux_power_right_arrow_icon' ' ')
left_arrow_icon=$(tmux_get '@tmux_power_left_arrow_icon' ' ')
session_icon="$(tmux_get '@tmux_power_session_icon' '󰪥')"
time_format=$(tmux_get @tmux_power_time_format '%0l:%M %p')
date_format=$(tmux_get @tmux_power_date_format '%b %d')

# short for Theme-Colour
FG=#b4befe
G01=#a6afeb
G02=#99a1d8
G03=#8b92c5
G04=#7d84b2
G05=#70759f
G06=#62678d
G07=#55587a
G08=#474a67
G09=#393b54
G10=#2c2d41
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
tmux_set @prefix_highlight_output_prefix "#[fg=$BG]#[bg=$FG]$left_arrow_icon"
tmux_set @prefix_highlight_output_suffix "#[fg=$BG]#[bg=$FG]$right_arrow_icon"

# Left side of status bar
tmux_set status-left-length 150

session_name=#S
LS="#[fg=$BG,bg=$FG] $session_icon $session_name #[fg=$FG]"

tmux_set status-left "$LS"

tmux_set status-right-length 150

RS="$time_format #[fg=$FG]"
RS="#[fg=$FG] 󰃰 $date_format $RS"
RS="#{prefix_highlight}$RS"

tmux_set status-right "$RS"

# Window status
tmux_set window-status-format "#[fg=$FG,bg=$BG]$right_arrow_icon#I:#W#F "
tmux_set window-status-current-format "#[fg=$FG]$right_arrow_icon#[fg=$FC,bold]#I:#W#F#[fg=$FG]$right_arrow_icon"

# Window separator  󰫣
tmux_set window-status-separator ""

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
