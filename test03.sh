#!/bin/dash

# Even more tests to check exit status of commands

echo 4q   >  commands.slippy
echo /2/d >> commands.slippy
seq 1 5 | ./slippy -f commands.slippy > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt commands.slippy
    exit 1
fi

echo /2/d >  commands.slippy
echo 4q   >> commands.slippy
seq 1 5 | ./slippy -f commands.slippy > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt commands.slippy
    exit 1
fi

seq 1 2 > two.txt
seq 1 5 > five.txt
./slippy '4q;/2/d' two.txt five.txt > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt commands.slippy two.txt five.txt
    exit 1
fi

rm -- test.txt commands.slippy two.txt five.txt
echo "tests passed"