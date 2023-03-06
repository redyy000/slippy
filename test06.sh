#!/bin/dash

# Check output of my program vs reference

seq 24 43 | 2041 slippy '/2/d # delete  ;  4  q # quit' > reference.txt
seq 24 43 | ./slippy '/2/d # delete  ;  4  q # quit' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt
    exit 1
fi

seq 1 5 | 2041 slippy '$d' > reference.txt
seq 1 5 | ./slippy '$d' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt
    exit 1
fi

seq 1 5 | 2041 slippy '/2/d
4q' > reference.txt
seq 1 5 | ./slippy '/2/d
4q' > myoutput.txt

if [ diff reference.txt myoutput.txt ] 2>/dev/null
    then echo "My output is different to reference output"
    rm -- myoutput.txt reference.txt
    exit 1
fi

rm -- myoutput.txt reference.txt
echo "tests passed"