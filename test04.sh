#!/bin/dash

# Few more tests to check exit status of commands

echo 4q   >  commands.slippy
echo /2/d >> commands.slippy
seq 1 2 > two.txt
seq 1 5 > five.txt
./slippy -f commands.slippy two.txt five.txt > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt commands.slippy two.txt five.txt
    exit 1
fi

seq 24 43 | ./slippy ' 3, 17  d  # comment' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt commands.slippy two.txt five.txt
    exit 1
fi

seq 24 43 | ./slippy '/2/d # delete  ;  4  q # quit' > test.txt

if ! [ $? -eq 0 ]
    then echo "Wrong exit status"
    rm -- test.txt commands.slippy two.txt five.txt
    exit 1
fi

rm -- test.txt commands.slippy two.txt five.txt
echo "tests passed"