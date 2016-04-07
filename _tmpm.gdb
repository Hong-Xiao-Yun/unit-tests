b main
r
source scripts/create_list.gdb
source scripts/print_list.gdb
source scripts/free_list.gdb
set $head = (List**)malloc(sizeof(List*))
set $cmp  = compare_asc
set logging file result-merge
create_list (*($head)) 3
set $_head = (*($head))
p $_head->value = 12
p $_head = $_head->next
p $_head->value = 4
p $_head = $_head->next
p $_head->value = 5
p $_head = $_head->next
set logging on
p "test begin"
p "old_list"
printf_list (*($head))
p merge_sort($head, $cmp)
set logging on
p "new_list"
printf_list (*($head))
free_list (*($head))
create_list (*($head)) 6
set $_head = (*($head))
p $_head->value = 456
p $_head = $_head->next
p $_head->value = 78
p $_head = $_head->next
p $_head->value = 41
p $_head = $_head->next
p $_head->value = 25
p $_head = $_head->next
p $_head->value = 1
p $_head = $_head->next
p $_head->value = 47
p $_head = $_head->next
set logging on
p "test begin"
p "old_list"
printf_list (*($head))
p merge_sort($head, $cmp)
set logging on
p "new_list"
printf_list (*($head))
free_list (*($head))
create_list (*($head)) 7
set $_head = (*($head))
p $_head->value = 7
p $_head = $_head->next
p $_head->value = 5
p $_head = $_head->next
p $_head->value = 97
p $_head = $_head->next
p $_head->value = 6
p $_head = $_head->next
p $_head->value = 3
p $_head = $_head->next
p $_head->value = 7
p $_head = $_head->next
p $_head->value = 8
p $_head = $_head->next
set logging on
p "test begin"
p "old_list"
printf_list (*($head))
p merge_sort($head, $cmp)
set logging on
p "new_list"
printf_list (*($head))

