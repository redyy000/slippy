#!/bin/dash

# More tests to check exit status of commands

seq 1 5 | ./slippy 'sX[15]XzzzX' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi

seq 1 5 | ./slippy '4q;/2/d' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi

seq 1 5 | ./slippy '4q
/2/d' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt
    exit 1
fi


rm -- test.txt
echo "tests passed"