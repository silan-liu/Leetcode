
// Definition for a binary tree node.
function TreeNode(val, left, right) {
  this.val = (val === undefined ? 0 : val)
  this.left = (left === undefined ? null : left)
  this.right = (right === undefined ? null : right)
}

/**
 * @param {TreeNode} root
 * @return {number}
 */
// https://leetcode.com/problems/find-bottom-left-tree-value/
// 38.35%
var findBottomLeftValue = function (root) {
  if (root) {
    // 当前需要遍历数据
    let list = []
    list.push(root)

    while (list.length > 0) {
      // 存储下一层数据
      let tmp = []
      let i = 0
      while (i < list.length) {
        const node = list[i]

        // 压入左子树
        if (node.left) {
          tmp.push(node.left)
        }

        // 压入右子树
        if (node.right) {
          tmp.push(node.right)
        }

        i += 1
      }

      // 把下一层数据赋值给 list
      if (tmp.length > 0) {
        list = tmp
      } else {
        break
      }
    }

    // 取最后一层的第一个数据
    if (list.length > 0) {
      const node = list[0]
      return node.val
    }
  }

  return null
};

const root = new TreeNode(1)
const n1 = new TreeNode(2)
const n2 = new TreeNode(3)
const n3 = new TreeNode(4)
const n4 = new TreeNode(5)
const n5 = new TreeNode(6)
const n6 = new TreeNode(7)

n1.left = n3
n3.left = n4
n3.right = n5

n5.left = n6
root.left = n1
root.right = n2

console.log(findBottomLeftValue(root))