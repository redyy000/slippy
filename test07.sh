#!/bin/dash

# Checking more output of my program vs reference

echo 4q   >  commands.slippy
echo /2/d >> commands.slippy
seq 1 2 > two.txt
seq 1 5 > five.txt
2041 slippy -f commands.slippy two.txt five.txt > reference.txt
./slippy -f commands.slippy two.txt five.txt > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt commands.slippy two.txt five.txt
    exit 1
fi

seq 1 2 > two.txt
seq 1 5 > five.txt
2041 slippy '4q;/2/d' five.txt two.txt > reference.txt
./slippy '4q;/2/d' five.txt two.txt > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt commands.slippy two.txt five.txt
    exit 1
fi

rm -- myoutput.txt reference.txt commands.slippy two.txt five.txt
echo "tests passed"