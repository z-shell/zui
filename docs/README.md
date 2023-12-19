<h1 align="center">
  <p align="center">
    <a href="https://github.com/z-shell/zi">
      <img src="https://raw.githubusercontent.com/z-shell/.github/main/profile/img/logo.png" alt="Logo" width="80" height="80" />❮ Zi ❯</a>
      -
      <a href="https://github.com/z-shell/zui">⬢ ZUI</a>
  </p>
</h1>

## ZUI – CGI+DHTML-like User Interface Library for Zsh / ZCurses

This is a RAD (Rapid Application Development) textual user interface library for Zsh. It in many aspects resembles a typical CGI+(D)HTML setup. There are:

- generators ran on the "server" side (basic Zshell-code that is just generating text!),
- event loop that turns the generated text into a document with active elements (buttons, anchors, toggle buttons, text fields, list boxes),
- mechanism to regenerate document parts from the original generators.

So, a Zshell code generates text. It is then turned into a document with hyperlinks. DHTML-like calls are possible that will regenerate document parts on the fly. Page can be also reloaded with input data, just like an HTML page.

A voiced [video tutorial](https://youtu.be/TfZ8b_RS_Bg) shows how to create an application – Nmap network scanner frontend.

> See also [ZSTYLES](ZSTYLES.md)

## Hello World

```zsh
# Started from Zle or from command line

-zui_std_cleanup deserialize:"zui-demo-hello-world"
-zui_std_init app:"zui-demo-hello-world" app_name:"ZUI Hello World"
emulate -LR zsh -o extended_glob -o typeset_silent -o warn_create_global
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

Other example which uses list-box: [zui-demo-list-box](https://github.com/z-shell/zui/blob/main/demos/zui-demo-list-boxes)

The API is described in the [wiki](https://wiki.zshell.dev/ecosystem/plugins/zui).

## Installation

**The plugin is "standalone"**, which means that only sourcing it is needed. To install, unpack `zui` somewhere and add to `zshrc`:

```zsh
source {where-zui-is}/zui.plugin.zsh
```

If using a plugin manager, then `Zi` is recommended, but you can use any other too, and also install with `Oh My Zsh` (by copying the directory to `~`/.oh-my-zsh/custom/plugins`).

### [Zi](https://github.com/z-shell/zi)

Add `zi load z-shell/zui` to your `.zshrc` file. ZI will handle the rest automatically the next time you start zsh. To update (i.e. to pull from origin) issue `zi update z-shell/zui`.

### Antigen

Add `antigen bundle z-shell/zui` to your `.zshrc` file. Antigen will handle cloning the plugin for you automatically the next time you start zsh.

### Oh-My-Zsh

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:z-shell/zui.git`
3. Add `zui` to your plugin list

### Zgen

Add `zgen load z-shell/zui` to your .zshrc file in the same place you're doing your other `zgen load` calls in.
