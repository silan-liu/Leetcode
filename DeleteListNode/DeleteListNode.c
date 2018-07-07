// https://leetcode.com/problems/delete-node-in-a-linked-list/description/
#include <stdio.h>

struct ListNode {
      int val;
      struct ListNode *next;
 };
 
void deleteNode(struct ListNode* node) {
     // next
    struct ListNode *next = node->next;

    // 用下一个节点替代该节点，删除下一个节点
    node->val = next->val;
    node->next = next->next;
}

int main(int argc, char const *argv[])
{
    return 0;
}
