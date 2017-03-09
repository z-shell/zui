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

autoload -- zui-list zui-list-draw zui-list-input zui-list-wrapper -zui-log zui-event-loop
autoload -- zui-process-buffer zui-process-buffer2 zui-usetty-wrapper
autoload -- zui-demo zui-demo-hello-world zui-demo-text-fields zui-demo-fly zui-demo-append zui-demo-buttons zui-demo-anchors

zle -N zui-demo
bindkey "^O^Z" zui-demo

#
# Global parameters
#

typeset -gAH ZUI
typeset -ga ZUI_MESSAGES

#
# Load modules
#

zmodload -F zsh/stat b:zstat && ZUI[stat_available]="1" || ZUI[stat_available]="0"
zmodload zsh/datetime && ZUI[datetime_available]="1" || ZUI[datetime_available]="0"

#
# Functions
#

# Cleanup and init stubs, to be first stdlib
# functions called, sourcing the libraries

function -zui_stdlib_cleanup() {
    unfunction -- -zui_stdlib_cleanup
    [[ "${ZUI[stdlib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/stdlib.lzui"
    [[ "${ZUI[syslib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/syslib.lzui"
    -zui_stdlib_cleanup "$@"
}

function -zui_stdlib_init() {
    unfunction -- -zui_stdlib_init
    [[ "${ZUI[stdlib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/stdlib.lzui"
    [[ "${ZUI[syslib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/syslib.lzui"
    -zui_stdlib_init "$@"
}

# vim:ft=zsh
