#!/bin/bash

echo 'b main' >> _tmpb.gdb
echo 'r' >> _tmpb.gdb
echo 'source scripts/create_list.gdb' >> _tmpb.gdb
echo 'source scripts/print_list.gdb' >> _tmpb.gdb
echo 'source scripts/free_list.gdb' >> _tmpb.gdb

echo 'set $head = (List**)malloc(sizeof(List*))' >> _tmpb.gdb
echo 'set $cmp = compare_asc' >> _tmpb.gdb
echo 'set logging file '$2>>_tmpb.gdb

echo ' '>>$2
exec < $1

while  (read var) 
do
	read var
	list_length=$var

	echo 'create_list (*($head)) '$list_length >> _tmpb.gdb
	read var
	list_value=($var)

	echo 'set $_head = (*($head))' >> _tmpb.gdb

	for value in "${list_value[@]}"
	do
		echo 'p $_head->value = '$value >> _tmpb.gdb
		echo 'p $_head = $_head->next' >> _tmpb.gdb
	done

	echo 'set logging on' >> _tmpb.gdb
	echo 'p "test begin"' >> _tmpb.gdb
	echo 'p "old_list"' >> _tmpb.gdb
	echo 'printf_list (*($head))' >> _tmpb.gdb
	echo 'set logging off' >> _tmpb.gdb
	echo 'p bubble_sort($head,$cmp)' >> _tmpb.gdb
	echo 'set logging on' >> _tmpb.gdb
	echo 'p "new_list"' >> _tmpb.gdb
	echo 'printf_list (*($head))' >> _tmpb.gdb

	echo 'set logging off' >> _tmpb.gdb
	echo 'free_list (*($head))' >> _tmpb.gdb
done

echo 'q' >> _tmpb.gdb
echo 'y' >> _tmpb.gdb

gdb -q -x _tmpb.gdb bin-bubble >>/dev/null

# rm _tmpb.gdb
