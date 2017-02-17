# Zstyles

The values being set are the defaults:

```zsh
zstyle -s ":plugin:zui" "colorpair" "white/black"
zstyle -t ":plugin:zui" "border" "no"
zstyle -t ":plugin:zui" "bold" "no"
```

Each application can override those via "...:app:{name}" zstyles, e.g. for application "zplugin":

```zsh
zstyle -s ":plugin:zui:app:zplugin" "colorpair" "10/17"
zstyle -t ":plugin:zui:app:zplugin" "border" "yes"
zstyle -t ":plugin:zui:app:zplugin" "bold" "yes"
```
