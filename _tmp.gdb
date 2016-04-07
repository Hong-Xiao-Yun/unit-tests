b main
r
source scripts/create_list.gdb
source scripts/printf_list.gdb
source scripts/find_node_address.gdb
set $head = (List*)0
set $node1 = (List*)0
set $node2 = (List*)0
create_list $head 5
set logging file result-swap
set logging on
p "test begin"
p "old_list"
printf_list $head
set logging off
find_node_address $head 1 $node1
find_node_address $head 4 $node2
p $head = swap($head,$node1,$node2)
set logging on
p "change 1  4"
p "new_list"
printf_list $head
set logging off
set logging on
p "test begin"
p "old_list"
printf_list $head
set logging off
find_node_address $head 2 $node1
find_node_address $head 1 $node2
p $head = swap($head,$node1,$node2)
set logging on
p "change 2  1"
p "new_list"
printf_list $head
set logging off
