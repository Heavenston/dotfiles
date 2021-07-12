#!/bin/sh

VOL=$(amixer sget Master)

if [[ $VOL =~ off ]]
then
    echo "MUT"
else
    [[ $VOL =~ ([0-9]+)% ]]
    echo VOL ${BASH_REMATCH[1]}%
fi
