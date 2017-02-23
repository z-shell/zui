# Zstyles

The values being set are the defaults:

```zsh
zstyle ":plugin:zui" colorpair "white/black"
zstyle ":plugin:zui" border "no"
zstyle ":plugin:zui" bold "no"
zstyle ":plugin:zui" mark "red reverse"         # String starting with color name, continued with
                                                # combination of: reverse, underline, blink, bold.
```

Each application can override those via "...:app:{name}" zstyles, e.g. for application "zplugin":

```zsh
zstyle ":plugin:zui:app:zplugin" colorpair "10/17"
zstyle ":plugin:zui:app:zplugin" border "yes"
zstyle ":plugin:zui:app:zplugin" bold "yes"
zstyle ":plugin:zui:app:zplugin" mark "blue reverse"
```
