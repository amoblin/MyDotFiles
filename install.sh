#!/bin/sh

# install oh-my-zsh
[ -d "$HOME/.oh-my-zsh" ] || (curl -L http://install.ohmyz.sh | sh)

# zsh config
#ln amoblin.zsh ~/.oh-my-zsh/custom
#ln amoblin.zsh-theme ~/.oh-my-zsh/theme

confs="_aliasrc _pryrc _zshrc _tigrc"
#confs=$confs" _tmux.conf"
#confs=$confs" _gitconfig"
confs=$confs"  _vimrc _screenrc _xvimrc"
#confs=$confs"  "
#confs=$confs"  "

for conf in $confs; do
    dist=`echo $conf|sed 's/_/./'`
    echo $conf $dist
    [ -s "$HOME/$dist" ] || ln -sf `pwd`/$conf $HOME/$dist
done

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

