#!/bin/bash

ITEMS=(assocCollections collections-Heaps collections-Sets sequences)

function main () {

    for item in ${ITEMS[*]}
    do
        echo -e "\n\nEntering ${item}...\n\n"
        cd ${item}
        pwd

        ./runVarBase.sh

        cd ..
        echo -e "\n\nDone ${item}...\n\n"

    done

}

main


