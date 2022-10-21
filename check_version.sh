#!/bin/bash
export LIB_OUTDATED=$(poetry show -o)
for ARG in "$@"; do
    export VERSION_LIB=$(echo $LIB_OUTDATED | grep $ARG)
    if [ -z "$VERSION_LIB" ]
    then
        echo "....${ARG} is updated"
    else
        IFS=' ' read -r -a array <<< $VERSION_LIB
        MSG+="....${ARG} outdated, please update ${ARG} ${array[1]} -> ${array[2]}"$'\n'
    fi
done
if [ ! -z "$MSG" ]
    then
        echo "$MSG"
    exit 1
fi