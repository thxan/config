#!/bin/bash

checkCmdExist() {

    if [ -z "$1" ]; then
        echo error params
        exit 1
    fi
    

    if [ -n "$(which $1)" ]; then
        echo "exist $1"

    else
        echo "not exist $1"
        checkInstall $2
    fi
}

checkInstall() {
    read -r -p "Are You Sure to Install $1? [Y/n] " input

    case $input in
    [yY][eE][sS] | [yY])
        echo installing $1.......
        apt install -y $1
        ;;

    [nN][oO] | [nN])
        echo "No"
        ;;

    *)
        echo "Invalid input..."
        exit 1
        ;;
    esac
}

checkCmdExist $1 $2
