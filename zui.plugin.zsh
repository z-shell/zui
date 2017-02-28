#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {wherezui-is}/zui.plugin.zsh
#
# to ~/.zshrc.
#

0="${(%):-%N}" # this gives immunity to functionargzero being unset
ZUI_REPO_DIR="${0%/*}"
ZUI_CONFIG_DIR="$HOME/.config/zui"

#
# Update FPATH if:
# 1. Not loading with Zplugin
# 2. Not having fpath already updated (that would equal: using other plugin manager)
#

if [[ -z "$ZPLG_CUR_PLUGIN" && "${fpath[(r)$ZUI_REPO_DIR]}" != $ZUI_REPO_DIR ]]; then
    fpath+=( "$ZUI_REPO_DIR" )
fi

[[ -z "${fg_bold[green]}" ]] && builtin autoload -Uz colors && colors

#
# Setup
#

autoload -- zui-list zui-list-draw zui-list-input zui-list-wrapper
autoload -- zui-process-buffer zui-process-buffer2 zui-usetty-wrapper
autoload -- -zui-log zui-test

zle -N zui-test
bindkey "^O^P" zui-test

#
# Global parameters
#

typeset -gAH ZUI
typeset -ga ZUI_MESSAGES

#
# Load modules
#

zmodload -F zsh/stat b:zstat && ZUI[stat_available]="1" || ZUI[stat_available]="0"

#
# Functions
#

# vim:ft=zsh
