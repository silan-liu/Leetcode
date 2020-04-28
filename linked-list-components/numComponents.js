// https://leetcode.com/problems/linked-list-components/submissions/
// Definition for singly-linked list.
function ListNode(val) {
    this.val = val;
    this.next = null;
}

 /* 
 * @param {ListNode} head
 * @param {number[]} G
 * @return {number}
 */
var numComponents = function(head, G) {
    if (head && G && G.length > 0) {
        let map = new Map()

        // 记录节点前后的值，若无则为 -1
        let pre = -1
        while (head) {
            let next = head.next ? head.next.val : -1
            map.set(head.val, [pre, next])

            pre = head.val
            head = head.next
        }

        console.log(map)

        let num = 0
        let i = 0
        let flagMap = new Map()
        while (i < G.length) {

            const value = G[i]

            if (!flagMap.get(value)) {

                flagMap.set(value, true)

                // 不是子集
                if (!map.has(value)) {
                    return 0
                }

                num += 1

                const list = map.get(value)
                let pre = list[0]
                let next = list[1]

                // 存在 pre
                while (pre !== -1 && G.includes(pre) && !flagMap.has(pre)) {
                    flagMap.set(pre, true)

                    // 继续找 pre 的 pre
                    const list = map.get(pre)

                    pre = list[0]
                }

                while (next !== -1 && G.includes(next) && !flagMap.has(next)) {
                    console.log(`has next: ${next}`)
                    flagMap.set(next, true)

                    const list = map.get(next)

                    next = list[1]
                }
            }

            i += 1
        }

        return num
    }

    return 0
};

var numComponents2 = function(head, G) {
    if (head && G && G.length > 0) {
        let nums = 0

        // 放入 set
        const set = new Set()
        G.forEach(element => {
            set.add(element)
        });

        // 遍历链表，若当前节点在 G 中，且下一个节点不在 G 中，则认为断开了链接，算一个 component。
        while (head) {

            if (set.has(head.val) && (head.next == null || !set.has(head.next.val))) {
                nums += 1
            }

            head = head.next
        }

        return nums
    }

    return 0
}

let n0 = new ListNode(0)
let n1 = new ListNode(1)

let n2 = new ListNode(2)
let n3 = new ListNode(3)
let n4 = new ListNode(4)

n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4

const G = [0, 1, 4, 2, 3]
console.log(numComponents(n0, G))
console.log(numComponents2(n0, G))
