# Improved shell ENVironment
This is a set of opinioned dotfiles used by me in daily work and in production.
The goal is to have robust, customizable and portable set of defaults for linux bash shell for daily work.

<img width="1058" alt="base" src="https://user-images.githubusercontent.com/1089800/28995982-3b1b28ea-79f7-11e7-9b81-9937ac542c91.png">

**Tested** on macOS and linux hosts.

**Table of Contents**

- [Features](#features)
- [Installation](#installation)
- [Customizing / Extending](#customizing--extending)
- [Shell](#shell)
- [GIT](#git)
- [Vim](#vim)
- [Did you know ...?](#did-you-know-)
- [Known issues](#known-issues)

## Features
* easy to customize / extend
* space aware smart/adaptive prompt
* highlighted error exit codes
* optimized for solarized colors
* handy aliases (system, git, etc)
* time of last activity
* fast git integration (current branch, branch state, defaults)
* root and remote host indicator
* sane vim defaults (pathogen, ctrlp, list-chars, solarized theme, ag-integration, tweaks, ...)
* readline tweaks
* tmux support
* respect non-interactive sessions

## Requirements

```bash
brew install autojump bash
```

then

```bash
chsh -s /usr/local/bin/bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
```

## Installation
```bash
git clone https://github.com/denyskoch/ienv ~/.ienv && ~/.ienv/install.sh
```

You should also install Solarized color theme for your terminal. ([ethanschoonover.com/solarized](http://ethanschoonover.com/solarized))

For faster and better fuzzy search results install **ag** the silver searcher:

```bash
brew install ag
```

## Customizing / Extending
You can edit and customize your .baschrc, .vimrc, .tmux.conf as usual. IENV is integrated gracefully (no symlinks, no file copies), so things should not break. Take a look at your .bashrc for example:

```bash
...

### IENV ###
[ -r ~/.ienv/entrypoint ] && source ~/.ienv/entrypoint
### VNEI ###
```

Since its just an include, you can simple add or override settings you like.

### Dark color theme
Simply switch terminal color theme e.g. solarized dark:
<img width="906" alt="dark" src="https://user-images.githubusercontent.com/1089800/28995979-3b17bad4-79f7-11e7-9f05-021c9d37e12e.png">

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
* for remote hosts/shels the hostname is printed on the right
* root shells looks dangerous for more attention and prevent upss
<img width="1058" alt="remote" src="https://user-images.githubusercontent.com/1089800/28995983-3b1bd61e-79f7-11e7-9002-7f145095fde6.png">

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
<img width="1082" alt="vim3" src="https://user-images.githubusercontent.com/1089800/28995985-3b34403c-79f7-11e7-904c-fa85a8f141ac.png">
<img width="1082" alt="vim2" src="https://user-images.githubusercontent.com/1089800/28995984-3b2dda80-79f7-11e7-9f82-3e5d03a8628b.png">

* dark color theme (e.g. solarized-dark)

    insert to your in your ~/.vimrc file:
    
    ``` vimrc
    set background=dark
    ```
    <img width="962" alt="vim_dark" src="https://user-images.githubusercontent.com/1089800/28995980-3b19df58-79f7-11e7-8ce9-9e41705eabff.png">

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
