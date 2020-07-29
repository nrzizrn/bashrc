#!/bin/bash

ask_yes_no()
{
    printf "[?] %s\n" "${1}"
    printf "You sure? [y/N]: "; read a
    if [ "${a}" == "Y" ] || [ "${a}" == "y" ]; then
        return 0
    else
        return 1
    fi
}

install()
{
    [ -f ~/.bashrc ] &&
        ask_yes_no "about to remove old ~/.bashrc" && rm -rf ~/.bashrc

    cp git-prompt.sh ~/.git-prompt.sh
    cp git-completion.bash ~/.git-completion.bash
    cp bashrc ~/.bashrc

    res_vim=${?}

    if [ "${res_vim}" == "0" ]; then
        printf "[+] Installed bashrc for user: %s\n\n" "${USER}"
    else
        printf "[-] Err installing bashrc for user: %s\n\n" "${USER}"
    fi
}

# install for user
install

# install for root as well?
if ask_yes_no "do you want to install it for root?"; then
    sudo bash -x -c "$(declare -f install; declare -f ask_yes_no); install"
fi


# eof
