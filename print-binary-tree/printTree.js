// https://leetcode.com/problems/print-binary-tree/
// Definition for a binary tree node.
function TreeNode(val, left, right) {
  this.val = val === undefined ? 0 : val;
  this.left = left === undefined ? null : left;
  this.right = right === undefined ? null : right;
}

/**
 * @param {TreeNode} root
 * @return {string[][]}
 */
// 32.56%
var printTree = function (root) {
  if (root) {
    // 记录每层节点距离父节点的列数
    let map = new Map()

    map.set(0, 0)

    // 计算行列数
    const colCount = calculateLevelSpace(root, map, 0)

    console.log(map)

    let array = []

    // 生成数组
    generateArray(root, map, array, colCount, Math.floor(colCount / 2), 0)

    return array
  }
}

var generateArray = function (root, map, array, colCount, col, row) {
  if (root) {
    if (array.length <= row) {
      const list = []

      // 初始化
      let i = 0
      while (i < colCount) {
        list.push("")
        i += 1
      }

      array.push(list)
    }

    array[row][col] = `${root.val}`
    const distance = map.get(row + 1)
    if (root.left) {
      generateArray(root.left, map, array, colCount, col - distance - 1, row + 1)
    }

    if (root.right) {
      generateArray(root.right, map, array, colCount, col + distance + 1, row + 1)
    }
  }
}

// 计算以 root 为父节点的树占据的列数
var calculateLevelSpace = function (root, map, level) {
  if (root) {

    const leftSpace = calculateLevelSpace(root.left, map, level + 1)
    const rightSpace = calculateLevelSpace(root.right, map, level + 1)

    const maxSpace = Math.max(leftSpace, rightSpace)

    const space = maxSpace * 2 + 1

    // 计算每层距离父节点的最大列数
    if (level !== 0) {
      if (map.has(level)) {
        const value = map.get(level)
        if (value < maxSpace) {
          map.set(level, maxSpace)
        }
      } else {
        map.set(level, maxSpace)
      }
    }

    return space
  } else {
    return 0
  }
}

let n1 = new TreeNode(1)
let n2 = new TreeNode(2)
let n3 = new TreeNode(3)
let n4 = new TreeNode(4)
let n5 = new TreeNode(5)
let n6 = new TreeNode(6)
let n7 = new TreeNode(7)
let n8 = new TreeNode(8)

n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
n4.left = n8
n3.left = n6
n3.right = n7

console.log(printTree(n1))