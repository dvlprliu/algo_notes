#include <stdio.h>
#include <stdlib.h>
#include "List.h"

Nodeptr talloc(void) {
    return (Nodeptr) malloc(sizeof(Node));
}

Nodeptr makeNode(int val) {
    Nodeptr node = talloc();
    node->val = val;
    node->next = NULL;
    return node;
}

void freeList(Nodeptr list) {
    Nodeptr position, tmp;

    position = list;
    while (position != NULL) {
        tmp = position->next;
        free(position);
        position = tmp;
    }
}

Nodeptr addAtHead(Nodeptr head, Nodeptr node) {
    if (!head) {
        return node;
    }
    node->next = head;
    return node;
}

Nodeptr addAtIndex(Nodeptr list, Nodeptr node, int index) {
    // index should not less than 0
    if (index < 0) {
        fprintf(stderr, "index less than 0\n");
        return list;
    }
    // new node should not be NULL
    if (!node) {
        return list;
    }
    // list should not be NULL
    if (!list) {
        return list;
    }
    Nodeptr cur = list;
    // insert at head
    if (index == 0 && cur->next == NULL) {
        node->next = cur;
        cur = node;
        list = cur;
        return list;
    }
    int curIdx = 0;
    // traverse the list
    while (cur && (curIdx <= index)) {
        if (curIdx == index) {
            node->next = cur->next;
            cur->next = node;
            break;
        }
        cur = cur->next;
        curIdx++;
    }
    return list;
}

int isEmpty(Nodeptr list) {
    return list->next == NULL;
}

int elementAtIndex(Nodeptr list, int index) {
    return -1;
}

Nodeptr deleteNodeAtIndex(Nodeptr list, int index) {
    if (!list) {
        return list;
    }
    if (index < 0) {
        fprintf(stderr, "index out of bound\n");
        return list;
    }
    Nodeptr pre = NULL;
    Nodeptr cur = list;
    int curIdx = 0;
    while (cur) {
        if (curIdx == index) {
            if (!pre) {
                Nodeptr deleted = cur;
                cur = cur->next;
                list = cur;
                free(deleted);
                deleted = NULL;
            } else {
                Nodeptr deleted = cur;
                pre->next = cur->next;
                cur->next = NULL;
                free(deleted);
                deleted = NULL;
            }
            break;
        }
        pre = cur;
        cur = cur->next;
        curIdx++;
        if (curIdx > index) {
            break;
        }
    }
    return list;
}

Nodeptr appendNode(Nodeptr head, Nodeptr node) {
    if (!head) {
        return node;
    }
    Nodeptr next = head->next;
    Nodeptr prev = head;
    while (next) {
        prev = next;
        next = next->next;
    }
    prev->next = node;
    return head;

}

void printList(Nodeptr list) {
    if (!list) {
        printf("NULL\n");
        return;
    }
    Nodeptr cur = list;
    printf("%d->", cur->val);
    printList(cur->next);
}

void printNode(Nodeptr head) {
    if (!head)
        return;
    printf("%d", head->val);
    Nodeptr next = head->next;
    while (next) {
        printf("->%d", next->val);
        next = next->next;
    }
    printf("->NULL\n");
}
