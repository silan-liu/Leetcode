#include <stdio.h>
#include <stdlib.h>

// https://leetcode.com/problems/intersection-of-two-linked-lists/submissions/
struct ListNode {
     int val;
     struct ListNode *next;
};

struct ListNode *getIntersectionNode(struct ListNode *headA, struct ListNode *headB) {

    int i = 0;
    int j = 0;
    struct ListNode *pa = headA;
    while (pa) {
        i++;
        pa = pa -> next;
    }

    struct ListNode *pb = headB;
    while (pb) {
        j++;
        pb = pb -> next;
    }

    int len = abs(i - j);
    struct ListNode *longP = i < j ? headB : headA;
    struct ListNode *shortP = i < j ? headA : headB;

    // 长度较长的链表头移动len个节点
    int k = 0;
    while (k < len) {
        longP = longP->next;
        k++;
    }

    // 同时移动
    while (longP && shortP) {
        if (longP == shortP) {
            return longP;
        }

        longP = longP->next;
        shortP = shortP->next;
    }

    return NULL;
}

int main() {
    struct ListNode p2;
    p2.val = 5;
    p2.next = NULL;

    struct ListNode p1;
    p1.val = 4;
    p1.next = &p2;

    struct ListNode headA;
    headA.val = 2;
    headA.next = &p1;

    struct ListNode headB;
    headB.val = 3;
    headB.next = &p1;

    struct ListNode *node = getIntersectionNode(&headA, &headB);
    printf("%d", node->val);
    return 0;
}