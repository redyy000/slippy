#!/bin/dash

# Some tests to check exit status of commands

seq 1 5 22 | ./slippy '4q' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi


seq 1 5 | ./slippy '4d' > test.txt
if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi


seq 10 20 | ./slippy 's/[15]/zzz/' > test.txt
if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi


rm -- test.txt
echo "tests passed"