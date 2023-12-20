# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# No plugin manager is needed to use this file.
# All that is needed is adding:
#
#   source {where-zui-is}/zui.plugin.zsh
#
# to ~/.zshrc.
#
# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[ZUI_DIR]="${0:h}"
Plugins[ZUI_CONFIG_DIR]="${ZI[CONFIG_DIR]}/zui:-${XDG_CONFIG_HOME:-$HOME/.config}/zi/zui"

# https://wiki.zshell.dev/community/zsh_plugin_standard#functions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

# Load colors
[[ ${+fg_bold} = "0" || -z "${fg_bold[green]}" ]] && builtin autoload -Uz colors && colors

#
# Setup
#

# Support reloading
(( ${+functions[zui-list]} )) && { unfunction -- zui-list zui-list-draw zui-list-input zui-list-wrapper -zui-log zui-event-loop -zui-list-box-loop zui-process-buffer zui-process-buffer2 zui-usetty-wrapper zui-demo-various zui-demo-hello-world zui-demo-text-fields zui-demo-fly zui-demo-append zui-demo-buttons zui-demo-anchors zui-demo-list-boxes zui-demo-history -zui_std_cleanup -zui_std_init 2>/dev/null; unset ZUI; }

autoload -- zui-list zui-list-draw zui-list-input zui-list-wrapper -zui-log zui-event-loop -zui-list-box-loop
autoload -- zui-process-buffer zui-process-buffer2 zui-usetty-wrapper

#
# Global parameters
#

typeset -gAH ZUI
typeset -ga ZUI_MESSAGES

# Enable demos if ZUI[DEMOS] is set, i.e.: typeset -A ZUI; ZUI[DEMOS]=1
if (( ZUI[DEMOS] )); then
  fpath+=( "${0:h}/demos" )

  autoload -- zui-demo-hello-world zui-demo-fly zui-demo-append zui-demo-text-fields zui-demo-list-boxes zui-demo-anchors
  autoload -- zui-demo-ganchors zui-demo-buttons zui-demo-special-text zui-demo-history zui-demo-various zui-demo-timeout
  autoload -- zui-demo-configure zui-demo-edit zui-demo-toggles zui-demo-nmap

  zle -N zui-demo-various
  bindkey "^O^Z" zui-demo-various
fi

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
  -zui_std_cleanup() {
    unfunction -- -zui_std_cleanup

    [[ "${ZUI[stdlib_sourced]}" != "1" ]] && source "${Plugins[ZUI_DIR]}/lib/stdlib.lzui"
    [[ "${ZUI[syslib_sourced]}" != "1" ]] && source "${Plugins[ZUI_DIR]}/lib/syslib.lzui"
    [[ "${ZUI[utillib_sourced]}" != "1" ]] && source "${Plugins[ZUI_DIR]}/lib/utillib.lzui"

    -zui_std_cleanup "$@"
  }
}

(( 0 == ${+functions[-zui_std_init]} )) && {
  -zui_std_init() {
    unfunction -- -zui_std_init

    [[ "${ZUI[stdlib_sourced]}" != "1" ]] && source "${Plugins[ZUI_DIR]}/lib/stdlib.lzui"
    [[ "${ZUI[syslib_sourced]}" != "1" ]] && source "${Plugins[ZUI_DIR]}/lib/syslib.lzui"
    [[ "${ZUI[utillib_sourced]}" != "1" ]] && source "${Plugins[ZUI_DIR]}/lib/utillib.lzui"

    -zui_std_init "$@"
  }
}
