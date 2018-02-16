# persepolis-windows-package-build
windows package build for [Persepolis Download Manager]('https://github.com/persepolisdm/persepolis')

# step 1: Preparing
## 1-1 clone or download [Persepolis]('https://github.com/persepolisdm/persepolis')

you can download usually or using git clients, I recommend [git for windows]('https://git-scm.com/download/win')

you can download the stable version from [release page]('https://github.com/persepolisdm/persepolis/releases') or last beta version from the [master branch]('https://github.com/persepolisdm/persepolis/archive/master.zip') after downloading or cloning extract and enter persepolis path, you now should see such this structure
```
persepolis
├── man
├── persepolis
│   ├── gui
│   └── scripts
├── resources
│   ├── Archdroid-Blue
│   ├── Archdroid-Red
│   ├── Breeze
│   ├── Breeze-Dark
│   ├── locales
│   ├── Papirus
│   ├── Papirus-Dark
│   └── Papirus-Light
├── test
└── xdg
```
## 1-2 python and dependencies
persepolis is a python program and we need python3 to build it, after freezing and building the package there are no more need python and its library
so download latest [python3]('https://www.python.org/downloads/windows/') and install it.
remember the destination directory and enable the **“Add Python 3.6 to PATH” option.**
