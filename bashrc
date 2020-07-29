# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -f "~/.local_settings" ] && source ~/.local_settings
source ~/.git-prompt.sh
source ~/.git-completion.bash

source /etc/profile.env

export LS_OPTIONS='--color=auto -N'


alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

alias bjson='python -m json.tool'


# Colors
#Black="$(tput setaf 1)"
#BlackBG="$(tput setab 0)"
DarkGrey="$(tput bold ; tput setaf 0)"
#LightGrey="$(tput setaf 7)"
#LightGreyBG="$(tput setab 7)"
White="$(tput bold ; tput setaf 7)"
Red="$(tput bold; tput setaf 1)"
#RedBG="$(tput setab 1)"
#LightRed="$(tput bold ; tput setaf 1)"
#Green="$(tput setaf 2)"
#GreenBG="$(tput setab 2)"
#LightGreen="$(tput bold ; tput setaf 2)"
#Brown="$(tput setaf 3)"
BrownBold="$(tput bold; tput setaf 3)"
#BrownBG="$(tput setab 3)"
Yellow="$(tput bold ; tput setaf 3)"
Blue="$(tput setaf 4)"
BlueBold="$(tput bold; tput setaf 4)"
#BlueBG="$(tput setab 4)"
#LightBlue="$(tput bold ; tput setaf 4)"
Purple="$(tput setaf 5)"
PurpleBold="$(tput bold; tput setaf 5)"
PurpleBG="$(tput setab 5)"
#Pink="$(tput bold ; tput setaf 5)"
Cyan="$(tput setaf 6)"
CyanBold="$(tput bold; tput setaf 6)"
#CyanBG="$(tput setab 6)"
#LightCyan="$(tput bold ; tput setaf 6)"
NC="$(tput sgr0)" # No Color

if [ "${EUID}" -ne 0 ]; then
    blah="\$"
    color_path=${White}
else
    blah="#"
    color_path=${Yellow}
fi

hostname_color=${Red}

PS1='$(__git_ps1 "\[$PurpleBold\](%s) ")\[$hostname_color\]${HOSTNAME} \[$color_path\]\W \[$Red\]${blah}\[$NC\] '

# Makefile auto completion
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

#eof
