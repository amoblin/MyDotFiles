#!/bin/sh

# install oh-my-zsh
[ -d "$HOME/.oh-my-zsh" ] || (curl -L http://install.ohmyz.sh | sh)

# zsh config
#ln amoblin.zsh ~/.oh-my-zsh/custom
#ln amoblin.zsh-theme ~/.oh-my-zsh/theme

confs="_aliasrc _pryrc"

for conf in $confs; do
    #    [ -s "$HOME/.vimrc" ] || ln -sf `pwd`/_vimrc $HOME/.vimrc
    dist=`echo $conf|sed 's/_/./'`
    echo $conf $dist
    ln -sf `pwd`/$conf ~/$dist
done

exit

#tmux config
ln -sf `pwd`/_tmux.conf ~/.tmux.conf

#ln _vimrc ~/.vimrc
#mkdir -p ~/.vim/backup

#ln _screenrc ~/.screenrc

#sudo cp gitconfig /etc/

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

