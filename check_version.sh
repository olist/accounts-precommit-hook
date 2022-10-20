#!/bin/bash
for ARG in "$@"; do
    export VERSION_LIB=$(poetry show -o | grep $ARG)
    if [ -z "$VERSION_LIB" ]
    then
        echo "$VERSION_LIB is updated"
    else
        IFS=' ' read -r -a array <<< $VERSION_LIB
        echo "$ARG outdated, please update $ARG ${array[1]} -> ${array[2]}"
        exit 1
    fi
done    