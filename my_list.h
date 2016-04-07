#ifndef __MY_LIST_H
#define __MY_LIST_H

typedef struct List_node {
    int value;
    struct List_node *next;
} List;

typedef int (*cmp_t)(int a, int b);
int compare_asc(int a, int b)
{
    return a > b;
}



#endif
