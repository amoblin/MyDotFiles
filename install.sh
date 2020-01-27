#!/bin/sh

# install oh-my-zsh
[ -d "$HOME/.oh-my-zsh" ] || (curl -L http://install.ohmyz.sh | sh)

# zsh config
#ln amoblin.zsh ~/.oh-my-zsh/custom
#ln amoblin.zsh-theme ~/.oh-my-zsh/theme

confs="_aliasrc _gitconfig _gitignore _pryrc _tigrc _tmux.conf _zshrc"
confs=$confs"  _vimrc _screenrc _xvimrc"
#confs=$confs"  "
#confs=$confs"  "

for conf in $confs; do
    dist=`echo $conf|sed 's/_/./'`
    if [ -s "$HOME/$dist" ]; then
        echo "ignore " $dist
    else
        echo $conf -> $dist;
        ln -sf `pwd`/$conf $HOME/$dist
    fi
done

dists=".config/karabiner/karabiner.json"
dists=$dists" "

for dist in $dists; do
    conf=`basename $dist`
    [ -s "$HOME/$dist" ] || (echo $conf $dist; ln -sf `pwd`/$conf $HOME/$dist)
done

conf="emacs.el"
dist=".emacs.d/init.el"
[ -s "$HOME/$dist" ] || (echo $conf $dist; ln -sf `pwd`/emacs.el $HOME/$dist)

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

