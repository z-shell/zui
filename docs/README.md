<h1 align="center">
  <p align="center">
    <a href="https://github.com/z-shell/zi">
      <img src="https://raw.githubusercontent.com/z-shell/.github/main/profile/img/logo.png" alt="Logo" width="80" height="80" />❮ Zi ❯</a>
      -
      <a href="https://github.com/z-shell/zui">⬢ ZUI</a>
  </p>
</h1>

## ZUI – CGI+DHTML-like User Interface Library for Zsh / ZCurses

This is a RAD (Rapid Application Development) textual user interface library for Zsh.

It in many aspects resembles a typical CGI+(D)HTML setup. There are:

- generators ran on the "server" side (basic Zshell code that is just generating text!)
- event loop that turns the generated text into a document with active elements (buttons, anchors, toggle buttons, text fields, list boxes)
- mechanism to regenerate document parts from the original generators

So, a Zshell code generates text. It is then turned into a document with hyperlinks. DHTML-like calls are possible that will regenerate document parts on the fly. Page can be also reloaded with input data, just like an HTML page.

A voiced [video tutorial](https://youtu.be/TfZ8b_RS_Bg) shows how to create an application – Nmap network scanner frontend.

> More: [zstyles](ZSTYLES.md), [demos](https://github.com/z-shell/zui/blob/main/demos/zui-demo-list-boxes)

The API is described in the [wiki](https://wiki.zshell.dev/ecosystem/plugins/zui).

## Hello World

Enable demo functions before loading the plugin:

```zsh
typeset -A ZUI
ZUI[DEMOS]=1
```

Started from Zle or the command line:

```zsh
-zui_std_cleanup deserialize:"zui-demo-hello-world"
-zui_std_init app:"zui-demo-hello-world" app_name:"ZUI Hello World"

emulate -LR zsh
setopt extended_glob typeset_silent warn_create_global

-zui_std_init2 # after emulate -LR
-zui_std_store_default_app_config b:border 1

demo_generator_A() {
  local mod="$1" ice="$2"
  # Content, no hyper-links
  reply=( "Hello World from ${ZUI[YELLOW]}ZUI${ZUI[FMT_END]}! Module $mod, instance $ice." )
  # Non-selectable lines   Hops to jump with [ and ]   Local anchors
  reply2=( )               reply3=( 1 )                reply4=( )
}
```

Start application:

```zsh
zui-event-loop 1:demo_generator_A

-zui_std_cleanup serialize
```

## Installation

**The plugin is "standalone"**, which means that only sourcing it is needed. To install, unpack <samp>zui</samp> and load from <samp>.zshrc</samp>:

```zsh
source {where-zui-is}/zui.plugin.zsh
```

### [Zi](https://github.com/z-shell/zi)

Add <samp>zi load z-shell/zui</samp> to your <samp>.zshrc</samp> file. ZI will handle the rest automatically the next time you start zsh. To update (i.e. to pull from origin) issue <samp>zi update z-shell/zui</samp>.

### Antigen

Add <samp>antigen bundle z-shell/zui</samp> to your <samp>.zshrc</samp> file. Antigen will handle cloning the plugin for you automatically the next time you start zsh.

### Oh-My-Zsh

1. <samp>cd ~/.oh-my-zsh/custom/plugins</samp>
2. <samp>git clone https://github.com/z-shell/zui.git</samp>
3. Add <samp>zui</samp> to your plugin list

### Zgen

Add <samp>zgen load z-shell/zui</samp> to your .zshrc file in the same place you're doing your other <samp>zgen load</samp> calls in.
