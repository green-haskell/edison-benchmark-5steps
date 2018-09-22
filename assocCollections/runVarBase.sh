#!/bin/bash

STEPS=(1 2 3 4 5)

WIPE_TIME_OUT=30


function initialize () {

    echo -e "\n\nCONTENTS of 'csvFileSets/' WILL BE WIPED in $WIPE_TIME_OUT seconds...\n\n"
    sleep $WIPE_TIME_OUT

    rm -rf csvFileSets/*

    for step in ${STEPS[*]}
    do
        mkdir -p csvFileSets/s${step}/
    done

}


function main () {

    initialize

    for step in ${STEPS[*]}
    do
        echo -e "\n\nBegin benchmarking for Step ${step}...\n\n"

        rm -f csvFileSets/*.csv
        cp sources/common/Defs-S${step}of5.hs sources/common/Defs.hs
        make 2>&1 | tee fullOutput-S${step}.txt
        mv csvFileSets/*.csv csvFileSets/s${step}/

        echo -e "\n\nEnd benchmarking for Step ${step}...\n\n"

    done

    cp sources/common/RealisticDefs.hs sources/common/Defs.hs

}


main


