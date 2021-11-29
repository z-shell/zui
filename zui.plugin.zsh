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
# 1. Not loading with ZI
# 2. Not having fpath already updated (that would equal: using other plugin manager)
#

if [[ -z "$ZI_CUR_PLUGIN" && "${fpath[(r)$ZUI_REPO_DIR]}" != $ZUI_REPO_DIR ]]; then
    fpath+=( "$ZUI_REPO_DIR" )
fi

[[ ${+fg_bold} = "0" || -z "${fg_bold[green]}" ]] && builtin autoload -Uz colors && colors

#
# Setup
#

# Support reloading
(( ${+functions[zui-list]} )) && { unfunction -- zui-list zui-list-draw zui-list-input zui-list-wrapper -zui-log zui-event-loop -zui-list-box-loop zui-process-buffer zui-process-buffer2 zui-usetty-wrapper zui-demo-various zui-demo-hello-world zui-demo-text-fields zui-demo-fly zui-demo-append zui-demo-buttons zui-demo-anchors zui-demo-list-boxes zui-demo-history -zui_std_cleanup -zui_std_init 2>/dev/null; unset ZUI; }

autoload -- zui-list zui-list-draw zui-list-input zui-list-wrapper -zui-log zui-event-loop -zui-list-box-loop
autoload -- zui-process-buffer zui-process-buffer2 zui-usetty-wrapper

fpath+=( "${ZUI_REPO_DIR}/demos" )
autoload -- zui-demo-hello-world zui-demo-fly zui-demo-append zui-demo-text-fields zui-demo-list-boxes zui-demo-anchors
autoload -- zui-demo-ganchors zui-demo-buttons zui-demo-special-text zui-demo-history zui-demo-various zui-demo-timeout
autoload -- zui-demo-configure zui-demo-edit zui-demo-toggles zui-demo-nmap

zle -N zui-demo-various
bindkey "^O^Z" zui-demo-various

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

(( 0 == ${+functions[-zui_std_cleanup]} )) && {
    function -zui_std_cleanup() {
        unfunction -- -zui_std_cleanup
        [[ "${ZUI[stdlib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/stdlib.lzui"
        [[ "${ZUI[syslib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/syslib.lzui"
        [[ "${ZUI[utillib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/utillib.lzui"
        -zui_std_cleanup "$@"
    }
}

(( 0 == ${+functions[-zui_std_init]} )) && {
    function -zui_std_init() {
        unfunction -- -zui_std_init
        [[ "${ZUI[stdlib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/stdlib.lzui"
        [[ "${ZUI[syslib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/syslib.lzui"
        [[ "${ZUI[utillib_sourced]}" != "1" ]] && source "${ZUI_REPO_DIR}/utillib.lzui"
        -zui_std_init "$@"
    }
}