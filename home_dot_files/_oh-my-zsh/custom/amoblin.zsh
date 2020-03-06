# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
ZSH_THEME="amoblin"
export EDITOR=emacs
plugins=(osx terminalapp git tmux)

#tmux_init()
#{
#    tmux new-session -s "amoblin" -d -n "~/Marboo"    # 开启一个会话
#    tmux new-window -n "other"          # 开启一个窗口
#    tmux split-window -h                # 开启一个竖屏
#    tmux split-window -v "top"          # 开启一个横屏,并执行top命令
#    tmux -2 attach-session -d           # tmux -2强制启用256color，连接已开启的tmux
#}

# 判断是否已有开启的tmux会话，没有则开启
#if which tmux 2>&1 >/dev/null; then
#    test -z "$TMUX" && (tmux attach || tmux_init)
#fi

# For boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/amoblin/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export GOPATH=~/.go