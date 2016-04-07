#!/bin/bash

echo 'b main' >> _tmpm.gdb
echo 'r' >> _tmpm.gdb
echo 'source scripts/create_list.gdb' >> _tmpm.gdb
echo 'source scripts/print_list.gdb' >> _tmpm.gdb
echo 'source scripts/free_list.gdb' >> _tmpm.gdb

echo 'set $head = (List**)malloc(sizeof(List*))' >> _tmpm.gdb
echo 'set $cmp  = compare_asc' >> _tmpm.gdb
echo 'set logging file '$2>>_tmpm.gdb

echo ' '>>$2
exec < $1

while  (read var) 
do
	read var
	list_length=$var

	echo 'create_list (*($head)) '$list_length >> _tmpm.gdb
	read var
	list_value=($var)

	echo 'set $_head = (*($head))' >> _tmpm.gdb

	for value in "${list_value[@]}"
	do
		echo 'p $_head->value = '$value >> _tmpm.gdb
		echo 'p $_head = $_head->next' >> _tmpm.gdb
	done

	echo 'set logging on' >> _tmpm.gdb
	echo 'p "test begin"' >> _tmpm.gdb
	echo 'p "old_list"' >> _tmpm.gdb
	echo 'printf_list (*($head))' >> _tmpm.gdb
	# echo 'set logging off' >> _tmpm.gdb
	echo 'p merge_sort($head, $cmp)' >> _tmpm.gdb
	echo 'set logging on' >> _tmpm.gdb
	echo 'p "new_list"' >> _tmpm.gdb
	echo 'printf_list (*($head))' >> _tmpm.gdb

	# echo 'set logging off' >> _tmpm.gdb
	echo 'free_list (*($head))' >> _tmpm.gdb
done

# echo 'q' >> _tmpm.gdb
# echo 'y' >> _tmpm.gdb

# gdb -q -nh -x _tmpm.gdb bin-merge >> /dev/null

# rm _tmpm.gdb
