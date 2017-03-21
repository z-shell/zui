# ⬢ ZUI – CGI+(D)HTML-like User Interface Library for Zsh / ZCurses

[![License (GPL version 3)](https://img.shields.io/badge/license-GNU%20GPL%20version%203-blue.svg?style=flat-square)](./LICENSE)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](./LICENSE)
![ZSH 4.3.17](https://img.shields.io/badge/zsh-v4.3.17-orange.svg?style=flat-square)

![Dharma logos](https://github.com/zdharma/zdharma.github.io/blob/master/static/img/logo_theme.png)

This is a RAD (Rapid Application Development) textual user interface library for Zsh. It in many aspects resembles typical CGI+(D)HTML setup. There are:

* generators ran on "server" side (basic Zshell-code that is just generating text!),
* event loop that turns the generated text into document with active elements (buttons, anchors, toggle buttons, text fields, list boxes),
* mechanism to regenerate document parts from the original generators.

So, a Zshell code generates text. It is then turned into document with hyperlinks. DHTML-like calls are possible that will regenerate document parts on the fly. Page can be also reloaded with input data, just like an HTML page.

## Hello World

```zsh
# Started from Zle or from command line

-zui_std_cleanup deserialize:"zui-demo-hello-world"
-zui_std_init app:"zui-demo-hello-world" app_name:"ZUI Hello World"
emulate -LR zsh -o extendedglob -o typesetsilent -o warncreateglobal
-zui_std_init2 # after emulate -LR

-zui_std_store_default_app_config b:border 1

demo_generator_A() {
    local mod="$1" ice="$2"

    # Content, no hyper-links
    reply=( "Hello World from ${ZUI[YELLOW]}ZUI${ZUI[FMT_END]}! Module $mod, instance $ice." )

    # Non-selectable lines   Hops to jump with [ and ]   Local anchors
    reply2=( )               reply3=( 1 )                reply4=( )
}

## Start application ##
zui-event-loop 1:demo_generator_A

-zui_std_cleanup serialize
```

![Hello World screenshot](https://github.com/zdharma/zdharma.github.io/blob/devel/src/static/img/scrsh/hello-world.png)

Other example which uses list-box: [zui-demo-list-box](https://github.com/zdharma/zui/blob/master/demos/zui-demo-list-boxes)

The API is described at the [wiki](https://github.com/zdharma/zui/wiki).

## Installation

**The plugin is "standalone"**, which means that only sourcing it is needed. So to
install, unpack `zui` somewhere and add

```zsh
source {where-zui-is}/zui.plugin.zsh
```

to `zshrc`.

If using a plugin manager, then `Zplugin` is recommended, but you can use any
other too, and also install with `Oh My Zsh` (by copying directory to
`~/.oh-my-zsh/custom/plugins`).

### [Zplugin](https://github.com/psprint/zplugin)

Add `zplugin load psprint/zui` to your `.zshrc` file. Zplugin will handle
cloning the plugin for you automatically the next time you start zsh. To update
issue `zplugin update psprint/zui` (`update-all` can also be used).

### Antigen

Add `antigen bundle psprint/zui` to your `.zshrc` file. Antigen will handle
cloning the plugin for you automatically the next time you start zsh.

### Oh-My-Zsh

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:psprint/zui.git`
3. Add `zui` to your plugin list

### Zgen

Add `zgen load psprint/zui` to your .zshrc file in the same place you're doing
your other `zgen load` calls in.
