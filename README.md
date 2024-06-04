# Persepolis Microsoft Windows package build
windows package build for [Persepolis Download Manager](https://github.com/persepolisdm/persepolis)

We build stable releases safely and you don't need to build it yourself. You can download Persepolis Download Manager for  Microsoft Windows from [release page](https://github.com/persepolisdm/persepolis/releases).
If you want to build Persepolis for Windows yourself, then this instruction can help you.
# step 1: Preparing
- ## 1-1 clone or download [Persepolis](https://github.com/persepolisdm/persepolis)

You can download project from our github page or using git clients.

You can download the stable version Source code from [release page](https://github.com/persepolisdm/persepolis/releases) or last git version from the [master branch](https://github.com/persepolisdm/persepolis/archive/master.zip).
After downloading or cloning, extract and enter persepolis path.
you can see this structure for directories now.

```
persepolis
├── man
├── persepolis
│   ├── gui
│   └── scripts
├── resources
├── test
└── xdg
```

You also need some file that we put them in this repository and we use them to build persepolis. so clone or download [this repository](https://github.com/persepolisdm/persepolis-windows-package-build) alongside persepolis directory, we should have this structure finally:

```
persepolisarea
├── persepolis-windows-package-build
└── persepolis
```

- ## 1-2 python
persepolis has been written in python so we need python3 to build it, after freezing and building the package there are no more need to python and its library.
Download latest [python3](https://www.python.org/downloads/windows/) and install it.

 **remember** the **destination directory** and enable the **“Add Python to PATH” option.**

- ## 1-3 dependencies & libraries
 - Install virtualenv with `pip install virtualenv` From windows terminal (**powershell**)
 - Create an environment with `virtualenv venv` in persepolis directory
 - Active it with `.\venv\Scripts\activate`
 - Install these libraries with `pip`

   `pip install PySide6 requests pypiwin32 setproctitle psutil yt_dlp pyinstaller`

 - Persepolis is gui for [**Aria2**](https://aria2.github.io) so we need it, you can download latest or specific version according to your system from [Aria2 release page](https://github.com/aria2/aria2/releases/)
 - Persepolis uses [**ffmpeg**](https://www.ffmpeg.org/) for mixing videos ([more info.](https://github.com/persepolisdm/persepolis/wiki/How-can-I-download-videos-from-youtube)). Download [ffmpeg](https://github.com/BtbN/FFmpeg-Builds/releases) (we use latest gpl version).
 - Persepolis uses [**sthp**](https://github.com/KaranGauswami/socks-to-http-proxy/) to enable socks proxy option, so download the binary from [releases page](https://github.com/KaranGauswami/socks-to-http-proxy/releases)

# step 2: test and run
Move **aria2c.exe**, **sthp.exe** and **ffmpeg.exe** to the test folder next to the test.py according to your system architecture

Open Windows terminal and Enter cloned persepolis directory with `cd` command and active env. run persepolis as test with this command.  

`python test/test.py`

- now persepolis should run as a python script. If you get some error you may had mistake. Open  an issue [here](https://github.com/persepolisdm/persepolis-windows-package-build/issues), We will help you :)

# step 3: build and freeze
Now let's build persepolis!

run Windows terminal and enter persepolis folder and active env, so build Pesrpolis browser integration by pyinstaller with this command:

```
pyinstaller '.\resources\PersepolisBI.py' -F -i '..\persepolis-windows-package-build\persepolis2.ico' -n "PersepolisBI" --version-file '..\persepolis-windows-package-build\bi_version.py' --clean
```

and build persepolis with this command:

```
pyinstaller '.\persepolis\Persepolis Download Manager.py' -F -w -i '..\persepolis-windows-package-build\persepolis1.ico' -n "Persepolis Download Manager" --version-file '..\persepolis-windows-package-build\version.py' --clean
```

`-w` means it is a windowed app, not a console one.

`-F` Create a one-file bundled executable.

`-i` perseplois icon.

`-n` name of bundled executable.

`--version-file` add persepolis version resource from `version.py` to the exe.

If everything goes well, you have some output like this

![pyinstaller](screen1.png)

 If you get error messages, you made mistake. Open  an issue [here](https://github.com/persepolisdm/persepolis-windows-package-build/issues), We will help you :)

- After this, you have bundled executable file in dist folder, Move `ffmpeg.exe`, `PersepolisBI.exe`, `sthp.exe` and `aria2c.exe` next to the `Persepolis Download Manager.exe`. you can run it and test it, it works perfectly

# step 4 (Optional): create package installer
You have executable perseplois and you can put it everywhere (next to the and `ffmpeg.exe`, `PersepolisBI`, `sthp.exe` and `aria2c.exe`) but we going to create a installer for windows.

- Download and install [Inno Setup](http://www.jrsoftware.org/isdl.php)
- you can create your installation or use our standard one, I put theme in this repository for both 32 and 64 architecture (`.iss files`). you should edit *`[Files]`* section and *LicenseFile, InfoAfterFile, OutputBaseFilename, SetupIconFile, UninstallDisplayIcon* according to your directory name, also I put license, persepolis readme, after installation text and icon in this repository.
- Build and compile installation if everything goes well, you have a persepolis installer.

 Enjoy it. :blush:
