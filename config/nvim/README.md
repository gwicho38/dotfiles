# Vim Overview

## Structure
```
📂 ~/.config/nvim
├── 📁 after
├── 📁 ftplugin
├── 📂 lua
│  ├── 🌑 myluamodule.lua
│  └── 📂 other_modules
│     ├── 🌑 anothermodule.lua
│     └── 🌑 init.lua
├── 📁 pack
├── 📁 plugin
├── 📁 syntax
└── 🇻 init.vim
```

## Notes

Lua modules are found inside a lua/ folder in your 'runtimepath' (for most users, this will mean ~/.config/nvim/lua on *nix systems and ~/AppData/Local/nvim/lua on Windows). You can require() files in this folder as Lua modules.

## Supported Runtime files

Much like Vimscript files, Lua files can be loaded automatically from special folders in your runtimepath. Currently, the following folders are supported:

colors/
compiler/
ftplugin/
ftdetect/
indent/
plugin/
syntax/

Note: in a runtime directory, all *.vim files are sourced before *.lua files

## Reference

https://github.com/nanotee/nvim-lua-guide
