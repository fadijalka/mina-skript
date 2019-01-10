#!/bin/bash
if [ -x "$file" ] && file "$file" | grep -q "Mach-O"
then
    echo "This is an executable Mac file"
elif [ -x "$file" ] && file "$file" | grep -q "GNU/Linux"
then
    echo "This is an executable Linux File"
elif [ -x "$file" ] && file "$file" | grep q "shell script"
then
    echo "This is an executable Shell Script"
elif [ -x "$file" ]
then
    echo "This file is merely marked executable, but what type is a mystery"
else
    echo "This file isn't even marked as being executable"
fi
