#ifndef _List_H

typedef struct node_t* Nodeptr;

typedef struct node_t {
    int val;
    struct node_t *next;
} Node;

typedef Nodeptr List;
typedef Nodeptr Position;

Nodeptr makeNode(int val);
Nodeptr appendNode(Nodeptr head, Nodeptr node);
Nodeptr addAtHead(Nodeptr head, Nodeptr node);
Nodeptr addAtIndex(Nodeptr list, Nodeptr node, int index);
Nodeptr deleteNodeAtIndex(Nodeptr list, int index);
void printList(Nodeptr list);
void freeList(Nodeptr list);

int isEmpty(Nodeptr list);
int isLast(Nodeptr list);
int isList(Position p, List l);
List makeList(List list);
void deleteList(List list);

#endif
