#!/bin/bash
# define file array
files=(/tmp/elements.tmp)

# find total number of files in an array
echo "Total files in array : ${#files[*]}"
total=${#files[*]}

# Use for loop iterate through an array
# $f stores current value
for f in "${files[@]}"
do
	echo -n "$f "
done

echo
echo
echo "**************************"
echo "*** C Style For Loop ****"
echo "**************************"
echo
# Use c style for loop
# get total subscripts in an array
total=${#files[*]}
#
for (( i=0; i<=$(( $total -1 )); i++ ))
do
    echo -n "${files[$i]} "
done

echo
