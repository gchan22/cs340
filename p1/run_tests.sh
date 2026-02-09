#!/bin/bash
#captures the program name
program=$1

#loops through the input to give a output when running program
for i in $(ls ./tests/inputs/*.input | sort -V)
do
    #strips to just the name without path or suffix
    testNa=$(basename "$i" .input)
    #keeps track test number
    testNum=${testNa#test_}
    #finds output associated with the input
    output="./tests/outputs/$testNa.output"
    #checks the output given by input and compares with correct output
    if ./$program "$i" | cmp -s - "$output"
    then
        echo "TEST $testNum: PASS"
    else
        echo "TEST $testNum: FAIL"
    fi

done
