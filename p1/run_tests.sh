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
   
    if [ "$(./$program "$i")" = "$(cat "$(find ./tests/outputs | grep "$count")")" ]
    then
        echo "TEST "$count": PASSED"
    else
        echo "TEST "$count": FAILED"
    fi
    # echo "$(./$program "$i")"
    # echo "$count"
    echo "$(cat "$(find ./tests/outputs | grep "$count")")"

    
    #increment current test number
    ((count++))
done
