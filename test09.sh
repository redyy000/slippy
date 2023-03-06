#!/bin/dash

# Some more checking of my program output vs reference

seq 2 3 20 | 2041 slippy -n '/^1/p' > reference.txt
seq 2 3 20 | ./slippy -n '/^1/p' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt
    exit 1
fi

echo Hello Andrew | 2041 slippy 's/e//' > reference.txt
echo Hello Andrew | ./slippy 's/e//' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt
    exit 1
fi

seq 100 111 | 2041 slippy 's/11/zzz/' > reference.txt
seq 100 111 | ./slippy 's/11/zzz/' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt
    exit 1
fi

rm -- myoutput.txt reference.txt
echo "tests passed"