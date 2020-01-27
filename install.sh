#!/bin/sh

# install oh-my-zsh
[ -d "$HOME/.oh-my-zsh" ] || (curl -L http://install.ohmyz.sh | sh)

# zsh config
#ln amoblin.zsh ~/.oh-my-zsh/custom
#ln amoblin.zsh-theme ~/.oh-my-zsh/theme

confs=(
    _aliasrc
    _gitconfig
    _gitignore
    _pryrc
    _tigrc
    _tmux.conf
    _zshrc
    _vimrc
    _screenrc
    _xvimrc
)

for conf in ${confs[@]}; do
    dist=~/`echo $conf|sed 's/_/./'`
    [ -s "$dist" ] && echo "ignore " $dist || (echo $conf -\> $dist; ln -sf `pwd`/$conf $dist)
done

dists=(
    ~/.config/karabiner/karabiner.json
    ~/Library/Developer/Xcode/UserData/KeyBindings/Emacs.idekeybindings
)

for dist in $dists; do
    conf=`basename $dist`
    [ -s "$dist" ] && echo "ignore " $dist || (echo $conf -\> $dist; ln -sf `pwd`/$conf $dist)
done

conf="emacs.el"
dist=~/.emacs.d/init.el
[ -s "$dist" ] && echo "ignore " $dist || (echo $conf -\> $dist; ln -sf `pwd`/emacs.el $dist)

exit

#mkdir -p ~/.vim/backup

# bash config
#sudo sh -c "cat inputrc >> /etc/inputrc"

#zsh config
#sudo sh -c "cat zshrc >> /etc/zshrc"
#sudo sh -c "cat hosts>> /etc/hosts"

# cygwin中没有bashrc。
#sudo sh -c "cat _bashrc >> /etc/bash.bashrc"
#sudo sh -c "cat inputrc >> /etc/profile"

#../python/install.sh

#git config --global user.name amoblin

#git config --global user.email amoblin@163.com

#input method
#fcitx

#cmake gcc git

#download tool
#axel

#browser
#google chrome

#utils
#screen

#video
#mplayer

#virtualbox

#vim-full

