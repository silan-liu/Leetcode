
// https://leetcode.com/problems/split-linked-list-in-parts/submissions/
// Definition for singly-linked list.
function ListNode(val, next) {
  this.val = (val === undefined ? 0 : val)
  this.next = (next === undefined ? null : next)
}

/**
 * @param {ListNode} root
 * @param {number} k
 * @return {ListNode[]}
 */
// 88.10%
var splitListToParts = function (root, k) {

  let result = []
  let len = 0
  let head = root
  while (head) {
    len += 1
    head = head.next
  }

  let countList = []
  let i = 0
  if (len < k) {
    while (i < k) {
      if (i < len) {
        countList.push(1)
      } else {
        countList.push(0)
      }

      i += 1
    }
  } else {
    const count = Math.floor(len / k)
    const remain = len - count * k
    while (i < k) {
      if (i < remain) {
        countList.push(count + 1)
      } else {
        countList.push(count)
      }

      i += 1
    }
  }

  let cur = root
  i = 0
  while (i < k) {
    const count = countList[i]
    let j = 0
    let head = null
    let pre = null
    while (j < count) {
      if (!head) {
        head = cur
      }

      pre = cur
      cur = cur.next
      j += 1
    }

    if (pre) {
      pre.next = null
    }

    result.push(head)

    i += 1
  }

  return result
};

let root = new ListNode(1)
let head = root
let j = 2
while (j <= 1000) {
  let node = new ListNode(j)
  head.next = node
  head = node
  j += 1
}

console.log(splitListToParts(null, 50))