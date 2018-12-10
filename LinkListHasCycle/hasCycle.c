#include "stdlib.h"
#include <stdbool.h>
#include <stdio.h>

// https://leetcode.com/problems/linked-list-cycle/submissions/
struct ListNode {
     int val;
     struct ListNode *next;
};
 
bool hasCycle(struct ListNode *head) {
    struct ListNode *p1 = NULL;
    
    if (head != NULL) {
        p1 = head->next;
    }

    struct ListNode *p2 = NULL;
    if (p1 != NULL) {
        p2 = p1->next;
    }
    
    while (p1 && p2) {
        if (p1 == p2) {
            return true;
        } else {
            p1 = p1->next;
            if (p2 != NULL && p2->next != NULL) {
                p2 = p2->next->next;
            } else {
                return false;
            }
        }
    }

    return false;
}

int main() {
    struct ListNode node1;
    node1.val = 0;

    struct ListNode node2;
    node2.val = 2;

    node1.next = &node2;

    struct ListNode node3;
    node3.val = 3;

    node2.next = &node3;

    struct ListNode node4;
    node4.val = 4;

    node3.next = &node4;

    node4.next = &node2;
    // node4.next = NULL;
    bool result = hasCycle(&node1);
    printf("%d", result);

    return 0;
}