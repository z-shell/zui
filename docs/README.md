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

The API is described in the [wiki](https://wiki.zshell.dev/ecosystem/plugins/zui).

## Demo Applications

Enable:

```zsh
typeset -A ZUI; ZUI[DEMOS]=1
```

> **Note**:
>
> - The above must be set before loading ZUI.

Available:

- [zui-demo-anchors](/demos/zui-demo-anchors)
- [zui-demo-buttons](/demos/zui-demo-buttons)
- [zui-demo-edit](/demos/zui-demo-edit)
- [zui-demo-ganchors](/demos/zui-demo-ganchors)
- [zui-demo-history](/demos/zui-demo-history)
- [zui-demo-nmap](/demos/zui-demo-nmap)
- [zui-demo-text-fields](/demos/zui-demo-text-fields)
- [zui-demo-toggles](/demos/zui-demo-toggles)
- [zui-demo-append](/demos/zui-demo-append)
- [zui-demo-configure](/demos/zui-demo-configure)
- [zui-demo-fly](/demos/zui-demo-fly)
- [zui-demo-hello-world](/demos/zui-demo-hello-world)
- [zui-demo-list-boxes](/demos/zui-demo-list-boxes)
- [zui-demo-special-text](/demos/zui-demo-special-text)
- [zui-demo-timeout](/demos/zui-demo-timeout)
- [zui-demo-various](/demos/zui-demo-various)

## Installation

**The plugin is "standalone"**, which means that only sourcing it is needed. To install, unpack <kbd>zui</kbd> and load from <kbd>.zshrc</kbd>:

```zsh
source {where-zui-is}/zui.plugin.zsh
```

### [Zi](https://github.com/z-shell/zi)

Add <kbd>zi load z-shell/zui</kbd> to your <kbd>.zshrc</kbd> file. ZI will handle the rest automatically the next time you start zsh. To update (i.e. to pull from origin) issue <kbd>zi update z-shell/zui</kbd>.

### Antigen

Add <kbd>antigen bundle z-shell/zui</kbd> to your <kbd>.zshrc</kbd> file. Antigen will handle cloning the plugin for you automatically the next time you start zsh.

### Oh-My-Zsh

1. <kbd>cd ~/.oh-my-zsh/custom/plugins</kbd>
2. <kbd>git clone https://github.com/z-shell/zui.git</kbd>
3. Add <kbd>zui</kbd> to your plugin list

### Zgen

Add <kbd>zgen load z-shell/zui</kbd> to your .zshrc file in the same place you're doing your other <kbd>zgen load</kbd> calls in.
