# Zstyles

The values being set are the defaults:

```zsh
zstyle ":plugin:zui" colorpair "white/black"
zstyle ":plugin:zui" border "no"
zstyle ":plugin:zui" bold "no"
zstyle ":plugin:zui" mark "red reverse lineund" # String starting with one or two color names continued
                                                # with combination of: reverse, underline, blink, bold,
                                                # lineund, linerev. Last two underline, reverse whole
                                                # active line. The rest marks active button. Uppercase
                                                # color names are for background.
zstyle ":plugin:zui" altmark "red reverse"      # As "mark", but for terminals without underline support

zstyle ":plugin:zui" text_mode "no"             # Navigate across each bit of text, not only buttons
                                                # Rather for implementing, not configuring
```

Each application can override those via "...:app:{name}" zstyles, e.g. for application "zplugin":

```zsh
zstyle ":plugin:zui:app:zplugin" colorpair "10/17"  # 256 colors – zsh >= 5.3; "default" color also from this version
zstyle ":plugin:zui:app:zplugin" border "yes"
zstyle ":plugin:zui:app:zplugin" bold "yes"
zstyle ":plugin:zui:app:zplugin" mark "blue WHITE reverse bold lineund"
zstyle ":plugin:zui:app:zplugin" altmark "green CYAN bold reverse"
```
