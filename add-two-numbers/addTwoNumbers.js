
// https://leetcode.com/problems/add-two-numbers/
// Definition for singly-linked list.
function ListNode(val, next) {
  this.val = (val === undefined ? 0 : val)
  this.next = (next === undefined ? null : next)
}

/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
// 21.69%
var addTwoNumbers = function (l1, l2) {
  const len1 = lengthOfListNode(l1)
  const len2 = lengthOfListNode(l2)

  let result, tmp

  let pShort = l1
  let pLong = l2

  if (len1 > len2) {
    pShort = l2
    pLong = l1
  }

  // 进位
  let c = 0

  // 遍历到短链表末尾
  while (pShort) {
    const n = pLong.val + pShort.val + c

    // 进位
    c = Math.floor(n / 10)

    const val = n % 10
    const node = new ListNode(val, null)
    console.log(val)

    if (!result) {
      result = node
      tmp = result
    } else {
      tmp.next = node
      tmp = node
    }

    pLong = pLong.next
    pShort = pShort.next
  }

  // 长链表遍历到末尾
  while (pLong) {
    const n = pLong.val + c

    // 进位
    c = Math.floor(n / 10)

    const val = n % 10
    const node = new ListNode(val, null)
    console.log(val)

    tmp.next = node
    tmp = node

    pLong = pLong.next
  }

  // 最高位有进位，需生成新节点
  if (c > 0) {
    const node = new ListNode(c, null)
    tmp.next = node
  }

  return result
};

// 链表长度
var lengthOfListNode = function (l1) {
  let i = 0
  let p = l1
  while (p) {
    i += 1
    p = p.next
  }

  return i
}

// 25.23%
var addTwoNumbers2 = function (l1, l2) {

  let result, tmp

  // 进位
  let c = 0

  // 遍历到短链表末尾
  while (l1 && l2) {
    const n = l1.val + l2.val + c

    // 进位
    c = Math.floor(n / 10)

    const val = n % 10
    const node = new ListNode(val, null)
    console.log(val)

    if (!result) {
      result = node
      tmp = result
    } else {
      tmp.next = node
      tmp = node
    }

    l1 = l1.next
    l2 = l2.next
  }

  let p
  if (l1) {
    p = l1
  } else if (l2) {
    p = l2
  }

  // 长链表遍历到末尾
  while (p) {
    const n = p.val + c

    // 进位
    c = Math.floor(n / 10)

    const val = n % 10
    const node = new ListNode(val, null)
    console.log(val)

    tmp.next = node
    tmp = node

    p = p.next
  }

  // 最高位有进位，需生成新节点
  if (c > 0) {
    const node = new ListNode(c, null)
    tmp.next = node
  }

  return result
};

var buildListNode = function (nums) {
  let i = 0
  let head = null
  let tmp = null
  while (i < nums.length) {
    const num = nums[i]
    const node = new ListNode(num, null)
    if (!head) {
      head = node
      tmp = head
    } else {
      tmp.next = node
      tmp = node
    }

    i += 1
  }

  return head
}

const l1 = buildListNode([2, 4, 3])
const l2 = buildListNode([4, 7, 6, 5])

console.log(addTwoNumbers(l1, l2))
console.log(addTwoNumbers2(l1, l2))