# ZUI – CGI+(D)HTML-like User Interface Library for Zsh / ZCurses

[![License (GPL version 3)](https://img.shields.io/badge/license-GNU%20GPL%20version%203-blue.svg?style=flat-square)](./LICENSE)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](./LICENSE)
![ZSH 4.3.17](https://img.shields.io/badge/zsh-v4.3.17-orange.svg?style=flat-square)

![Dharma logos](https://github.com/zdharma/zdharma.github.io/blob/master/static/img/logo_theme.png)

This is a RAD (Rapid Application Development) user interface library for Zsh. It in many aspects resembles typical CGI+(D)HTML setup. There are:

* generators ran on "server" side (basic Zshell-code that is just generating text!),
* event loop that turns the generated text into document with active elements (buttons, anchors, toggle buttons, text fields, list boxes),
* mechanism to regenerate document parts from the original generators.

So, a Zshell code generates text. It is then turned into document with hyperlinks. DHTML-like calls are possible that will regenerate document parts on the fly. Page can be also reloaded with input data, just like an HTML page.
