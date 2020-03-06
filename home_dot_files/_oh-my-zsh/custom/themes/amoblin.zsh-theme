# from essembeh
# Theme with full path names and hostname
# Handy if you work on different servers all the time;
#
#export LSCOLORS="Gxfxcxdxbxegedabagacad"

export LSCOLORS=exfxaxdxcxegedabagacad

source ~/.alias

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

# from steeef
#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
#    yellow="%F{226}"
    yellow="$fg[yellow]"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
    yellow="$fg[yellow]"
fi

function my_git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	GIT_STATUS=$(git_prompt_status)
	[[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Colored prompt
ZSH_THEME_COLOR_PWD="cyan" 
#ZSH_THEME_COLOR_GIT_BRANCH="%{$orange%}"
ZSH_THEME_COLOR_GIT_BRANCH="%{$yellow%}"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
#PROMPT='${ret_status}%{$fg_bold[$ZSH_THEME_COLOR_PWD]%}%~%{$reset_color%} $(my_git_prompt_info)%(!.#.$) '
PROMPT='${ret_status}%{$fg_bold[$ZSH_THEME_COLOR_PWD]%}%c%{$reset_color%} $(my_git_prompt_info)%(!.#.$) '
RPS0="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$ZSH_THEME_COLOR_GIT_BRANCH%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

