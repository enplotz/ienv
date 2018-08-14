# Improved shell ENVironment 

Forked from [denyskoch/ienv](https://github.com/denyskoch/ienv).


**Table of Contents**

- [Features](#features)
- [Installation](#installation)
- [Customizing / Extending](#customizing--extending)
- [Shell](#shell)
- [GIT](#git)
- [Vim](#vim)
- [Did you know ...?](#did-you-know-)
- [Known issues](#known-issues)


## Requirements

We need an up-to-date bash and vim (compiled with termguicolors option)

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

We also need a NerdFont 🤓 (a font patched with icons). For example, I like FiraCode, so I'm using the patched version of it:

```bash
curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip
```

Unzip and install the version for your OS.


## Installation
```bash
git clone --recursive https://github.com/enplotz/ienv ~/.ienv && ~/.ienv/install.sh
```

You should also install "Gruvbox Dark" ([morhetz/gruvbox-contrib](https://github.com/morhetz/gruvbox-contrib/tree/master/iterm2)).

Alternatively, you can use "Solarized Dark Patched" color theme for your terminal ([mbadolato/iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes/#solarized-dark---patched)).



For faster and better fuzzy search results install **ag** the silver searcher:

```bash
brew install ag
```

## Customizing / Extending
You can edit and customize your .baschrc, .vimrc, .tmux.conf as usual. IENV is integrated gracefully (no symlinks (ok, only for vim plugins/themes), no file copies), so things should not break. Take a look at your .bashrc for example:

```bash
...

### IENV ###
[ -r ~/.ienv/entrypoint ] && source ~/.ienv/entrypoint
### VNEI ###
```

Since its just an include, you can simple add or override settings you like.

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
* **dl**: go to downloads folder i.e. cd ~/Downloads
* ***p**: go to project directory i.e. cd ~/Projects
* **gp**: go to GO workspace i.e. cd $GOPATH
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


## GIT
* push strategy is set to simple
* default editor is vim
* colors set to auto
* gobal gitignore for annoying OS generated files:

    ```
    .DS_Store
    .DS_Store?
    ._*
    .Spotlight-V100
    .Trashes
    __MACOSX
    ehthumbs.db
    Thumbs.db
    Desktop.ini
    *~
    *.swp
    *.swo
    ```

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


* dark color theme (e.g. solarized8)

    insert to your in your ~/.vimrc file:

    ``` vimrc
    set background=dark
    ```


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

### macOS bash
```
bash: shopt: autocd: invalid shell option name
bash: shopt: dirspell: invalid shell option name
bash: update_terminal_cwd: command not found
```
Since macOS is using a old version of bash, this errors will occur.

Bash v4+ is required, you can install it via brew `brew install bash` ([brew.sh](https://brew.sh))

### Vim issues in dark terminals
If you use dark terminal theme, you need to add `set background=dark`
to your .vimrc
