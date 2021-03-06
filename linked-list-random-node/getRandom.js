// https://leetcode.com/problems/linked-list-random-node/submissions/
/**
 * Definition for singly-linked list.
 */
function ListNode(val) {
     this.val = val;
     this.next = null;
}

/**
 * @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node.
 * @param {ListNode} head
 */
var Solution = function(head) {
    this.head = head

    let length = 0
    while (head) {
        length += 1
        head = head.next
    }

    this.length = length
};

/**
 * Returns a random node's value.
 * @return {number}
 */
Solution.prototype.getRandom = function() {
    if (this.length > 0) {
        const random = Math.floor(Math.random() * this.length)

        let i = 0
        let node = this.head
        while (i < random) {
            node = node.next
            i += 1
        }

        return node.val
    }
};


var Solution1 = function(head) {
    this.head = head
};

Solution1.prototype.getRandom = function() {
    let count = 1
    let node = this.head
    let result

    while (node) {
        // 生成 [0, count-1] 的随机数
        const random = Math.floor(Math.random() * (count))

        // 替换节点
        if (random === 0) {
            result = node
        }

        count += 1

        node = node.next
    }

    return result.val
};

let n1 = new ListNode(1)
let n2 = new ListNode(2)
let n3 = new ListNode(3)

n1.next = n2
n2.next = n3

var obj = new Solution(n1)
console.log(obj.getRandom())


var obj1 = new Solution1(n1)
console.log(obj1.getRandom())