#!/bin/sh

# This script contains some useful functions.

#
# Outs a message.
#
# Example 1: outMessage "Hello, World!
# Example 2: outMessage "Hello, World!" "OK"
# Example 3: outMessage "Hello, World!" "RED" -block
#
# @param string $1 - an output string
# @param enum sting $2 - a color of the string: BLACK, RED, GREEN, ORANGE, BLUE, CYAN, GREY, YELLOW, WHITE,
#                        or common information: OK, ERROR, INF
# @param enum string $3 - a key word about the message style: "-block"
#
outMessage()
{
    if [ "$2" == "-block" -o "$3" == "-block" ]; then
        BLOCKED="true"
    else
        BLOCKED="false"
    fi
    SEPARATOR='------------------------------------------------------------------------------'
    # No color for terminating
    NC='\e[0m'
    # Set a color for text
    if [ "$2" == "BLACK" ]; then
        COLOR='\e[0;30m'
    elif [ "$2" == "RED" ]; then
        COLOR='\e[0;31m'
    elif [ "$2" == "GREEN" ]; then
        COLOR='\e[0;32m'
    elif [ "$2" == "ORANGE" ]; then
        COLOR='\e[0;33m'
    elif [ "$2" == "BLUE" ]; then
        COLOR='\e[0;34m'
    elif [ "$2" == "PURPLE" ]; then
        COLOR='\e[0;35m'
    elif [ "$2" == "CYAN" ]; then
        COLOR='\e[0;36m'
    elif [ "$2" == "GRAY" ]; then
        COLOR='\e[0;37m'
    elif [ "$2" == "YELLOW" ]; then
        COLOR='\e[0;93m'
    elif [ "$2" == "WHITE" ]; then
        COLOR='\e[0;97m'
    # Set notifications
    elif [ "$2" == "OK" ]; then
        COLOR='\e[0;32m'
    elif [ "$2" == "ERR" ]; then
        COLOR='\e[0;31m'
    elif [ "$2" == "INF" ]; then
        COLOR='\e[0;93m'
    # Set no color
    else
        COLOR='\e[0m'
    fi
    # Print the massage
    if [ $BLOCKED == "true" ]; then
        echo -e "${COLOR}$SEPARATOR${NC}"
    fi
    echo -e "${COLOR}$1${NC}"
    if [ $BLOCKED == "true" ]; then
        echo -e "${COLOR}$SEPARATOR${NC}"
    fi
}

#
# Tests if an user pressed yes.
#
# @param string $1 - a read varriable.
# @return 1 if yes pressed, or 0 if no pressed, or otherwise -1
#
isYesPressed()
{
    if [ $1 == "y" -o $1 == "Y" ]; then
        return 1
    elif [ $1 == "n" -o $1 == "N" ]; then
        return 0
    else
        return -1
    fi
}

#
# Waits if an user pressed yes or no.
#
# @param string $1 - message string.
# @return 1 if yes pressed, or 0 if no pressed
#
waitYesPressed()
{
    while [ true ]
    do
        read -p "$1 (Y/N): " VAR
        if [ $VAR == "y" -o $VAR == "Y" ]; then
            RET=1
            break;
        elif [ $VAR == "n" -o $VAR == "N" ]; then
            RET=0
            break;
        fi
    done
    return $RET
}
