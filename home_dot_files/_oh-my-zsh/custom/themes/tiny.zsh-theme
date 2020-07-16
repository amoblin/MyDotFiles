#!/bin/sh

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

# BLOCK START
# fork from robbyrussell

PROMPT="%(?:%{$fg_bold[green]%}%m ➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# BLOCK END


# BLOCK START

# https://superuser.com/questions/943844/add-timestamp-to-oh-my-zsh-robbyrussell-theme/943916

# feature: update prompt with current time when a command is started
## https://stackoverflow.com/questions/13125825/zsh-update-prompt-with-current-time-when-a-command-is-started
strlen () {
    FOO=$1
    local zero='%([BSUbfksu]|([FB]|){*})'
    LEN=${#${(S%%)FOO//$~zero/}}
    echo $LEN
}

# show right prompt with date ONLY when command is executed
preexec () {
    _DATE=$( date +"%F %H:%M:%S.%3N" )
    DATE=[${_DATE}]
    local len_right=$( strlen "$DATE" )
    len_right=$(( $len_right+1 ))
    local right_start=$(($COLUMNS - $len_right))

    local len_cmd=$( strlen "$@" )
    local len_prompt=$(strlen "$PROMPT" )
    local len_left=$(($len_cmd+$len_prompt))

    RDATE="\033[${right_start}C ${GREEN}${DATE}${NOCOLOR}"

    if [ $len_left -lt $right_start ]; then
        # command does not overwrite right prompt
        # ok to move up one line
        echo -e "\033[1A${RDATE}"
    else
        echo -e "${RDATE}"
    fi

    timer=$(($(date +%s%0N)/1000000))
#    export RPROMPT="%F{cyan}${DATE} %{$reset_color%}"
}

# https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    #    export RPROMPT="%F{cyan}${elapsed}ms %{$reset_color%}"

    # 超过1秒钟，echo提示，超过2分钟，语音提示
    echo_limit=1000
    say_limit=120000

    # for debug
    #echo_limit=1
    #say_limit=1

    DATE=$( date +"%F %H:%M:%S.%3N" )
    # [ $elapsed -gt $say_limit ] && echo "say 执行完成，耗时${elapsed}毫秒 &" > /tmp/zsh-precmd-amoblin && . /tmp/zsh-precmd-amoblin
    [ $elapsed -gt $echo_limit ] && echo "${GREEN}Finished, cost ${elapsed}ms: ${_DATE} - ${DATE}${NOCOLOR}"

    unset timer
    unset DATE
  fi
}

# BLOCK END
