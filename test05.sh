#!/bin/dash

# Last set of tests to check exit status of commands

seq 1 10000 | ./slippy -n '$p' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi

seq 10 21 | ./slippy '/1$/,/^2/d' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi

seq 1 3 | 2041 slippy -n -i 's/1/2/g' 2>/dev/null

if ! [ $? -eq 1 ]
    then echo "Test should have raised an error"
    rm -- test.txt
    exit 1
fi

rm -- test.txt
echo "tests passed"