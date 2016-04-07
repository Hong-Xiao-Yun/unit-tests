#include <stdio.h>
#include <stdlib.h>
#include "my_list.h"
#include "swap.c"
List *recursive_sort(List *left, int countNum,cmp_t cmp)
{
    if (countNum==1){
        printf("%d\n",left->value );
        left -> next=NULL;
        return left;
     }   
    List *head=NULL;
    List *link=NULL;
    List *right=left;
    int endLeft=0;
    int endRight=0;
    int tmpcount=0;
    List *combindnode=NULL;
    printf("hi\n");
   
    tmpcount= countNum /2;
    endLeft=tmpcount;
    endRight=countNum - tmpcount;
    // printf("before 2 for loop %d\n", count);
    for (List *sub_head=left; tmpcount >0 ; tmpcount--)
    {
        
        right=right->next;
        // printf("2 for loop%d\n",right->value);
    }

    left = recursive_sort(left,endLeft,cmp);
    right =recursive_sort(right,endRight,cmp);
    #if 1
    while(endLeft > 0 &&  endRight >0){
        if(cmp(left->value,right->value)){
                combindnode=right;
                right=right->next;
                endRight--;
        }else{
                combindnode=left;
                left=left->next;
                endLeft--;
        }
        if (head)
        {
            link->next=combindnode;
            link=link->next;
        }else{
            head=combindnode;
            link=combindnode;
            // link=link->next;            

        }
       
    }
     if (left)
        {
            link ->next=left;
        }else{
            link->next=right;
        }
    # endif
    return head;
}

void merge_sort(List **head, cmp_t cmp)
{
    int count=0;

   if (head == NULL || (*head == NULL))
          return;

     for (List *sub_head=*head;sub_head;sub_head = sub_head->next){
            count++;
    }       
     *head = recursive_sort(*head,count, cmp);
    
    return;
}
