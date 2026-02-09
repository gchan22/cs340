#!/bin/bash
#captures the program name
program=$1

#keeps track of the test number
count=0
# echo "$(find ./tests/outputs | grep "$count")" 
#loops through the input to give a output when running program
for i in ./tests/inputs/*
do
    #checks the output given by input and compares with correct output
    
    output=$(find ./tests/outputs | grep test_"$count".output)
    if [ "$(./$program "$i")" = "$(cat "$output")" ]
    then
        echo "TEST "$count": PASS"
    else
        echo "TEST "$count": FAIL"
    fi

    #increment current test number
    ((count++))
done
