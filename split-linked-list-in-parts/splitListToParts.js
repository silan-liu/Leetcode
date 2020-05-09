
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

  // 计算链表长度
  let len = 0
  let head = root
  while (head) {
    len += 1
    head = head.next
  }

  let countList = []
  let i = 0

  // 如果长度小于分组个数，则每个组单独为 1，后面补 0
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
    // 求出平均个数
    const count = Math.floor(len / k)

    // 若不能平均分配，则从前面每个 + 1
    const remain = len % k
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
  // 计算每组的链表头
  while (i < k) {
    const count = countList[i]
    let j = 0
    let pre = null

    // 添加头结点
    result.push(cur)

    // 往后数 count 个
    while (j < count) {
      pre = cur
      cur = cur.next
      j += 1
    }

    // 将一组的链尾置空，否则会保持原有链接关系
    if (pre) {
      pre.next = null
    }

    i += 1
  }

  return result
};

let root = new ListNode(1)
let head = root
let j = 2
while (j <= 10) {
  let node = new ListNode(j)
  head.next = node
  head = node
  j += 1
}

console.log(splitListToParts(root, 4))