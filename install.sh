 #!/bin/sh

BEGIN_STR="### IENV ###"
END_STR="### VNEI ###"

proceed() {
    echo -n "$1 (y/n) "
    read answer
    echo "$answer" | grep -iq "^y"
    return $?
}

# check if already installed ...
if grep -isq "$BEGIN_STR"  $HOME/.{inputrc,bashrc} && grep -isq "$BEGIN_STR"  $HOME/.{inputrc,bashrc} ; then
    if ! proceed "seems like already installed, proceed?" ; then
        echo "canceled"
        exit;
    fi
fi

# install bashrc
echo $BEGIN_STR >> $HOME/.bashrc
echo "[ -r ~/.ienv/entrypoint ] && source ~/.ienv/entrypoint" >> $HOME/.bashrc
echo $END_STR >> $HOME/.bashrc

# create bash_profile, if needed
if [ ! -f $HOME/.bash_profile ]; then
    if proceed "create .bash_profile?" ; then
        echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" >> $HOME/.bash_profile
    fi
fi

# install inputrc
echo $BEGIN_STR >> $HOME/.inputrc
echo "\$include ~/.ienv/inputrc" >> $HOME/.inputrc
echo $END_STR >> $HOME/.inputrc

# install gitconfig
echo $BEGIN_STR >> $HOME/.gitconfig
echo "[include]" >> $HOME/.gitconfig
echo "    path = ~/.ienv/gitconfig" >> $HOME/.gitconfig
echo $END_STR >> $HOME/.gitconfig

# install tmux.conf
echo $BEGIN_STR >> $HOME/.tmux.conf
echo "if-shell '[ -r ~/.ienv/tmux ]' \"source-file ~/.ienv/tmux\"" >> $HOME/.tmux.conf
echo $END_STR >> $HOME/.tmux.conf

# install vimrc and pathogen
if procced "setup vimrc and pathogen?" ; then
    echo "\" IENV" >> $HOME/.vimrc
    echo "if filereadable(glob(\"~/.ienv/vimrc\"))" >> $HOME/.vimrc
    echo "    source ~/.ienv/vimrc" >> $HOME/.vimrc
    echo "endif" >> $HOME/.vimrc
    echo "\" VNEI" >> $HOME/.vimrc
    mkdir -p $HOME/.vim/swapfiles/

    echo "installing pathogen.vim and basic plugins ..."
    mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    pushd
    cd ~/.vim/bundle
    git clone https://github.com/altercation/vim-colors-solarized.git
    git clone https://github.com/ctrlpvim/ctrlp.vim.git
    popd
fi

echo "DONE: You should now restart your session/terminal"
