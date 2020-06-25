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

    // 设置第 0 层的值为 0，因为根节点没有父节点
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

/**
 * 生成数组
 * @param {*} root 父节点
 * @param {*} map 每层节点距离父节点最大距离
 * @param {*} array 数组
 * @param {*} colCount 总列数
 * @param {*} col 当前列
 * @param {*} row 当前行
 */
var generateArray = function (root, map, array, colCount, col, row) {
  if (root) {
    // 如果数组中不存在该行，则初始化
    if (array.length <= row) {
      const list = []

      // 初始化数据
      let i = 0
      while (i < colCount) {
        list.push("")
        i += 1
      }

      array.push(list)
    }

    // 填入值
    array[row][col] = `${root.val}`

    // 计算下一行距离父节点距离
    const distance = map.get(row + 1)

    // 左子树，列数减少
    if (root.left) {
      generateArray(root.left, map, array, colCount, col - distance - 1, row + 1)
    }

    // 右子树，列数增加
    if (root.right) {
      generateArray(root.right, map, array, colCount, col + distance + 1, row + 1)
    }
  }
}

/**
 * 计算以 root 为父节点的树占据的列数
 * @param {*} root 父节点
 * @param {*} map 记录每层每个节点中距离父节点的最大值
 * @param {*} level 当前层级
 */
var calculateLevelSpace = function (root, map, level) {
  if (root) {

    // 计算左子树所占列数
    const leftSpace = calculateLevelSpace(root.left, map, level + 1)

    // 计算右子树所占列数
    const rightSpace = calculateLevelSpace(root.right, map, level + 1)

    // 取其较大者
    const maxSpace = Math.max(leftSpace, rightSpace)

    // 当前节点所占列数为 2*maxSpace + 1
    const space = maxSpace * 2 + 1

    // 计算每层距离父节点的最大列数，根节点不用更新，初始置为了 0
    if (level !== 0) {
      // 更新每层的最大列数
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