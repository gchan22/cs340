#captures the program name
program=$0

#keeps track of the test number
count=0
#loops through the input to give a output when running program
for i in $(find ./tests/input -type f | sort) 
do
    #checks the output given by input and compares with correct output
    for j in $(find ./tests/output -type f | grep "$count" |sort)
    do
        if [ "$(./$program "$i")" = "$(cat "$j")" ]
        then
            echo "TEST "$i": PASSED"
        else
            echo "TEST "$i": FAILED"
        fi
    done
    #increment current test number
    ((count++))
done