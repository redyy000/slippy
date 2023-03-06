#!/bin/dash

# Some more tests to check exit status of commands

echo Hello Andrew | ./slippy 's/e//g' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi

seq 51 60 | ./slippy '5s/5/9/g' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi

seq 2 3 20 | ./slippy -n '/^1/p' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi


rm -- test.txt
echo "tests passed"