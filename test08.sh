#!/bin/dash

# More checking of my program output vs reference

echo 4q   >  commands.slippy
echo /2/d >> commands.slippy
seq 1 5 | 2041 slippy -f commands.slippy > reference.txt
seq 1 5 | ./slippy -f commands.slippy > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt commands.slippy
    exit 1
fi

seq 1 5 | 2041 slippy '/2/d;4q' > reference.txt
seq 1 5 | ./slippy '/2/d;4q' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt commands.slippy
    exit 1
fi

seq 1 5 | 2041 slippy 's?[15]?zzz?' > reference.txt
seq 1 5 | ./slippy 's?[15]?zzz?' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt commands.slippy
    exit 1
fi

rm -- myoutput.txt reference.txt commands.slippy
echo "tests passed"