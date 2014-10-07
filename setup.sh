#!/bin/bash

# Check if unarchived files already there
hasAllFiles=true
files="README-paging-policy paging-policy.py"
for file in $files; do
    #echo "Checking for $file"
    if [ -e "$file" ]
    then
        echo "$file already exists"
    else
        hasAllFiles=false
    fi
done

if $hasAllFiles;
then
    echo "Already has all files downloaded and unarchived."
    echo
    exit
fi

echo
echo "=== Download paging-policy.py from http://pages.cs.wisc.edu/~remzi/OSTEP/Homework/homework.html ==="
echo

wget -O hw-paging-policy.tgz http://pages.cs.wisc.edu/~remzi/OSTEP/Homework/HW-Paging-Policy.tgz

echo
echo "=== Unarchiving download ==="
echo

tar xvzf hw-paging-policy.tgz

# Check if successful

echo
echo "=== Removing old tar download ==="
rm hw-paging-policy.tgz
echo

echo "=== Go to http://pages.cs.wisc.edu/~remzi/OSTEP/vm-beyondphys-policy.pdf and learn more ==="
echo
