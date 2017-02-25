# Zstyles

The values being set are the defaults:

```zsh
zstyle ":plugin:zui" colorpair "white/black"         # Default text color. For Zsh >= 5.3, color "default"
                                                     # is available, it might be e.g. transparent (depends
                                                     # on terminal configuration)
zstyle ":plugin:zui" border "no"                     # No border around main window
zstyle ":plugin:zui" border_cp "yellow/black"        # Border color
zstyle ":plugin:zui" bold "no"                       # No default bold

zstyle ":plugin:zui" status_colorpair "white/black"  # The same as "colorpair", but for status window
zstyle ":plugin:zui" status_border "no"
zstyle ":plugin:zui" status_border_cp "green/black"  # Border color of status window
zstyle ":plugin:zui" status_bold "no"

zstyle ":plugin:zui" mark "red reverse lineund" # String starting with one or two color names continued
                                                # with combination of: reverse, underline, blink, bold,
                                                # lineund, linerev. Last two underline, reverse whole
                                                # active line. The rest marks active button. Uppercase
                                                # color names are for background.
zstyle ":plugin:zui" altmark "red reverse"      # As "mark", but for terminals without underline support

zstyle ":plugin:zui" status_size "3"            # Height of status window, including border (drawn or not)

# Implementation Zstyles
zstyle ":plugin:zui" text_mode "no"             # Navigate across each bit of text, not only buttons
                                                # Rather for implementing, not configuring
zstyle ":plugin:zui" text_select "no"           # Allow selection on non-buttons (non-hyperlinks)
```

Each application can override those via "...:app:{name}" zstyles, e.g. for application "zplugin":

```zsh
zstyle ":plugin:zui:app:zplugin" colorpair "10/17"  # 256 colors – zsh >= 5.3; "default" color also from this version
zstyle ":plugin:zui:app:zplugin" border "yes"
zstyle ":plugin:zui:app:zplugin" bold "yes"
zstyle ":plugin:zui:app:zplugin" mark "blue WHITE reverse bold lineund"
zstyle ":plugin:zui:app:zplugin" altmark "green CYAN bold reverse"
zstyle ":plugin:zui:app:zplugin" status_size "4"    # More space for long messages

zstyle ":plugin:zui:app:zplugin" text_mode "1"
zstyle ":plugin:zui:app:zplugin" text_select "true"
```
