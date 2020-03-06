#!/bin/sh

# install oh-my-zsh
[ -d "$HOME/.oh-my-zsh" ] || (curl -L http://install.ohmyz.sh | sh)

# zsh config
item=`pwd`/home_dot_files/_oh-my-zsh/custom/amoblin.zsh
dist=~/.oh-my-zsh/custom/amoblin.zsh
[ -s $dist ] && echo igonre "$item" || (echo $item -\> $dist; ln -sf $item $dist)

item=`pwd`/home_dot_files/_oh-my-zsh/custom/themes/amoblin.zsh-theme
dist=~/.oh-my-zsh/custom/themes/amoblin.zsh-theme
[ -s $dist ] && echo igonre "$item" || (echo $item -\> $dist; ln -sf $item $dist)

item=`pwd`/home_dot_files/_oh-my-zsh/custom/themes/tiny.zsh-theme
dist=~/.oh-my-zsh/custom/themes/tiny.zsh-theme
[ -s $dist ] && echo igonre "$item" || (echo $item -\> $dist; ln -sf $item $dist)

item=`pwd`/bin
dist=~/bin
[ -s $dist ] && echo igonre "bin" || (echo $item -\> $dist; ln -sf $item $dist)

for conf in `pwd`/home_dot_files/*; do
    c=`basename $conf`
    dist=~/`echo $c|sed 's/_/./'`
    [ -s "$dist" ] && echo "ignore " $c || (echo $c -\> $dist; ln -sf $conf $dist)
done

dists=(
    ~/.config/karabiner/karabiner.json
    ~/Library/Developer/Xcode/UserData/KeyBindings/Emacs.idekeybindings
)

for dist in $dists; do
    conf=`basename $dist`
    [ -s "$dist" ] && echo "ignore " $dist || (echo $conf -\> $dist; ln -sf `pwd`/$conf $dist)
done

services=`pwd`/services
dist=~/Library/LaunchAgents
for item in ${services}/*.plist; do
    d=$dist/`basename $item`
    [ -s "$d" ] && echo "ignore " $item || (echo $item -\> $d; ln -sf $item $d)
done

item=`pwd`/emacsclient/EmacsClient.app
d=/Applications/EmacsClient.app
[ -s "$d" ] && echo "ignore " $item || (echo $item -\> $d; ln -sf $item $d)

item=`pwd`/home_dot_files/_plantumlrc
d=/usr/local/etc/plantumlrc
[ -s "$d" ] && echo "ignore " $item || (echo $item -\> $d; ln -sf $item $d)
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
