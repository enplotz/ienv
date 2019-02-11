# Improved shell ENVironment 

You could call this dotfiles repository "opinionated", but most of the things are just how they were when I forked the repo and some things are to my liking.
Something's probably broken, too.
Pull requests are highly appreciated.

- Forked from [denyskoch/ienv](https://github.com/denyskoch/ienv).
- Currently tested **only on macOS 10.13**! I hope to use it on Ubuntu very soon.

![Screenshot of prompt](https://raw.githubusercontent.com/enplotz/ienv/master/images/prompt.png)


**Table of Contents**

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Customizing / Extending](#customizing--extending)
- [Shell](#shell)
- [Git](#git)
- [Vim](#vim)
- [Did you know ...?](#did-you-know-)
- [Known issues](#known-issues)


## Features

- gruvbox theme (with true color and italics support!)
- vim *8* config
- some okayish tmux config, I guess
- root indicator
- command timestamp and error code

![Screenshot of vim/tmux](https://raw.githubusercontent.com/enplotz/ienv/master/images/vimtmux.png)

## Requirements

### 🖥 macOS (10.13)

We need an up-to-date bash and vim (compiled with `termguicolors` option by default)

```bash
brew install autojump bash
brew install vim --with-override-system-vi
```

then

```bash
chsh -s /usr/local/bin/bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
```

Make your new bash the default root shell: `sudo dscl . -change /Users/root UserShell /bin/sh /usr/local/bin/bash`. You can change to a root account with `sudo -s` and preserve your `$PS1`.

### Font

We also need a NerdFont 🤓 (a font patched with icons). For example, I like FiraCode, so I'm using the patched version of it.
It also works with `airline` (aligned symbols).
If you installed the font correctly, you should see a little icon in the title of this readme (and not some garbage).

```bash
curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip
```
Unzip and install the version for your OS.

## Installation
```bash
git clone --recursive https://github.com/enplotz/ienv ~/.ienv && ~/.ienv/install.sh
```

### Colors (iTerm2 & macOS)

One Half Light


You should also install "Gruvbox Light" ([morhetz/gruvbox-contrib](https://github.com/morhetz/gruvbox-contrib/tree/master/iterm2)).

Alternatively, you can also try "Solarized Dark Patched" color theme for your terminal ([mbadolato/iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes/#solarized-dark---patched)).

Do not set the color contrast too high via iTerms slider, or else you will get fancy triangles in the status line (which took me forever to debug!).

### Optional

For faster and better fuzzy search results install **ag** the silver searcher:

```bash
brew install ag
```

## Customizing / Extending
You can edit and customize your .baschrc, .vimrc, .tmux.conf as usual. IENV is integrated gracefully (no symlinks (well, only for vim plugins/themes), no file copies), so things should not break. Take a look at your .bashrc for example:

```bash
...

### IENV ###
[ -r ~/.ienv/entrypoint ] && source ~/.ienv/entrypoint
### VNEI ###
```

Since its just an include, you can simply add or override settings you like.


## Shell
* automatically cd to directory:

    ```bash
    /work $ kitchen
    cd -- kitchen
    /work/kitchen $
    ```
* auto correct wrong spelled directories

    ```bash
    /work/demo $ ls
    abc bar foo

    /work/demo $ cd bra
    /work/demo/bar $
    ```

* search in bash history with arrow keys e.g.:

    ```bash
    /work/demo/bar $ ssh<arrow up>
    ```


### Aliases
#### common
* **pw**: generate strong password with help of openSSL
* **h**: show history
* **hs**: history search (i.e. history | grep -i)
* **..**: go one directory up
* **...**: go two directories up
* **....**: go three directories up
* **ll**: long list i.e. ls -ahl
* **ips**: show current IPs

    ```
    $ ips
    Public: 95.208.248.59
    Local: 192.168.0.164
    Gateway: 192.168.0.1
    ```


#### git and related
* **g**: shortcut for git
* **s**: git status
* **a &lt;files&gt;**: git add (**a -A** to add all files)
* **c**: git commit
* **cm &lt;msg&gt;**: git commit -m
* **d**: git diff
* **co &lt;branch&gt;**: git checkout
* **l**: fancy git log (graph)

#### macOS
* **update**: update software and brew software
* **flushdns**: clear dns cache
* **hidedesktop / showdesktop**: Hide/show all desktop icons (useful when presenting)


### Remote Shell
* for remote hosts/shells the hostname is printed on the right
* root shells looks dangerous for more attention and prevent upss


## Git
* push strategy is set to simple
* default editor is vim
* colors set to auto
* gobal gitignore for annoying OS generated files (like `.DS_Store`)

## Vim
* persistend undos: you can even undo after vim is closed and opened again
* silver searcher (ag) integration for CtrlP
* custom status line
* auto folding of deep nested blocks
* easy split and buffer movement

### some shortcuts
* **ctrl + p** to start fuzzy search
* **ctrl + n** for auto complete

#### some normal mode commands / shortcuts
* **ctrl + j**, **ctrl + k**, **ctrl + h**, **ctrl + l** for split movement
* **z** to toggle fold under cursor
* **gd** go to definition
* **J** (shift + j) switch to next buffer
* **K** (shift + k) switch to previous buffer


## Did you know ...?
* you can simply toggle between last used directories:

    ``` bash
    /work/demo/foo $ cd /work/
    /work $ cd -
    /work/demo/foo $
    /work/demo/foo $ cd -
    /work $
    ```

* **cd** without arguments return you back to $HOME
* `killall <name>` kill process by name (alternative to `kill <pid>`)


## Known issues

Feel free to open a new issue on GitHub.

- sometimes the color scheme looks off either in vim or in vim inside a tmux
- mouse-based copy/paste in vim and vim+tmux might not work (in general, this is difficult to get right since everyone that uses vim/tmux longer than me seems to have their own preferences)

### macOS bash
```
bash: shopt: autocd: invalid shell option name
bash: shopt: dirspell: invalid shell option name
bash: update_terminal_cwd: command not found
```
Since macOS is using a old version of bash, these errors will occur.

Bash v4+ is required, you can install it via brew `brew install bash` ([brew.sh](https://brew.sh))

### Vim issues in dark terminals
If you use dark terminal theme, you need to add `set background=dark`
to your .vimrc

### Colorscheme looks fancy broken

You are not using a terminal emulator that supports TrueColor.

### Note on `pip install --user`

As per [Homebrew](https://docs.brew.sh/Homebrew-and-Python), if you use Homebrew to install python3:

    The normal `pip install --user` is disabled for brewed Python. This is because of a bug in `distutils`, because Homebrew writes a `distutils.cfg` which sets the package prefix.

    A possible workaround (which puts executable scripts in `~/Library/Python/<X>.<Y>/bin`) is:

    ```bash
    python -m pip install --user --install-option="--prefix=" <package-name>
    ```

So, we also include the path(s) above in `$PATH` for Python 3 (so `<X>` = 3).