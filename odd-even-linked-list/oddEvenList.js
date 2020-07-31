// https://leetcode.com/problems/odd-even-linked-list/
// Definition for singly-linked list.
function ListNode(val, next) {
  this.val = val === undefined ? 0 : val;
  this.next = next === undefined ? null : next;
}

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
// 16.12%
var oddEvenList = function (head) {
  if (head) {
    // 指向奇数节点
    let p = head;

    // 当前节点
    let cur = head;

    // 前一节点
    let pre = null;

    // 记录第几个节点
    let i = 1;

    while (cur) {
      if (i % 2 === 1) {
        // 非第一个奇数节点
        if (pre) {
          const next = cur.next;

          // 插入到奇数节点后
          cur.next = p.next;
          p.next = cur;

          // 删除 cur
          pre.next = next;

          // 更新当前节点
          cur = next;

          // 指向插入的节点
          p = p.next;
        } else {
          pre = cur;
          cur = cur.next;
        }
      } else {
        pre = cur;
        cur = cur.next;
      }

      i += 1;
    }
  }
  return head;
};

var printLinkList = function (head) {
  while (head) {
    console.log(head.val);
    head = head.next;
  }

  console.log("-------");
};

const n1 = new ListNode(1);
const n2 = new ListNode(2);
const n3 = new ListNode(3);
const n4 = new ListNode(4);
const n5 = new ListNode(5);
const n6 = new ListNode(6);
const n7 = new ListNode(7);

n2.next = n1;
n1.next = n3;
n3.next = n5;
n5.next = n6;
n6.next = n4;
n4.next = n7;

oddEvenList(n2);

printLinkList(n2);
