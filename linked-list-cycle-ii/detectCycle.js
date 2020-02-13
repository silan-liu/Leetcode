// Definition for singly-linked list.
function ListNode(val) {
    this.val = val;
    this.next = null;
}


/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function(head) {
    if (!head) {
        return null
    }

    // 快慢指针，p1 一次走一步，p2 一次走两步
    let p1 = head.next
    let p2
    if (head.next && head.next.next) {
        p2 = head.next.next
    } 

    while (p1 && p2 && p1 !== p2) {

        if (p1.next) {
            p1 = p1.next
        } else {
            return null
        }

        if (p2.next && p2.next.next) {
            p2 = p2.next.next
        } else {
            return null
        }
    }

    // 有环
    if (p1 && p2 && p1 === p2) {
        // 从头结点和相遇节点开始，一次一步，若相等，则为入口
        let p3 = head
        while (p3 !== p1) {
            p3 = p3.next
            p1 = p1.next
        }

        return p1
    }

    return null
};

let n1 = new ListNode(1)
let n2 = new ListNode(2)
let n3 = new ListNode(3)
let n4 = new ListNode(4)
let n5 = new ListNode(5)
let n6 = new ListNode(6)


n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
n5.next = n6
n6.next = n1

console.log(detectCycle(n1))