#!/bin/bash
find -type f -iname '*.*' -print0 | while read -r old new
do
    arr=( ${old} )
    if (( ${#arr[@]} == 1 ))
    then
        mv "${arr[0]}" "$new"
    else
        echo "Error: Multiple files found for $old: ${arr[@]}"
    fi    
done < replace.txt
