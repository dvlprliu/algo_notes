//
// Created by zhzh liu on 2022/10/16.
//
#include <stdio.h>
#include "List.h"

int main() {
    Nodeptr node = makeNode(0);
    Nodeptr second = makeNode(2);
    Nodeptr third = makeNode(3);
    Nodeptr forth = makeNode(4);
    Nodeptr list = node;
    appendNode(list, second);
    appendNode(list, third);
    list = addAtHead(list, forth);
    Nodeptr fifth = makeNode(5);
    list = addAtIndex(list, fifth, 0);
    printList(list);
    Nodeptr sixth = makeNode(6);
    list = addAtIndex(list, sixth, 3);
    printList(list);
    Nodeptr seventh = makeNode(7);
    list = addAtIndex(list, seventh, 100);
    printList(list);

    // test delete
    // an empty list
    printf("test delete node\n");
    Nodeptr emptylist = deleteNodeAtIndex(list, 0);
    printList(emptylist);

    deleteNodeAtIndex(emptylist, 3);
    printList(emptylist);
    printf("-----------end---------\n");

    printf("before free: ");
    printList(emptylist);
    freeList(emptylist);
    printList(emptylist);
}