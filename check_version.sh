#!/bin/bash
export VERSION_LIB=$(poetry show -o | grep accounts-drf)
if [ -z "$VERSION_LIB" ]
then
      echo "\$VERSION_LIB is ok"
else
      IFS=' ' read -r -a array <<< $VERSION_LIB
      echo "accounts-drf outdated, please update accounts-drf ${array[1]} -> ${array[2]}"
      exit 1
fi