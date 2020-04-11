
// https://leetcode.com/problems/binary-tree-coloring-game/
// Definition for a binary tree node.
function TreeNode(val) {
  this.val = val;
  this.left = this.right = null;
}

/**
 * @param {TreeNode} root
 * @param {number} n
 * @param {number} x
 * @return {boolean}
 */
// 82.22%
var btreeGameWinningMove = function (root, n, x) {
  // 如果是根节点
  if (root.val === x) {
    // 计算其左子树节点数
    const leftNodes = numOfNodes(root.left)

    // 如果左子树节点 > 剩余节点数，则取其左子树有可能
    if (leftNodes > n - leftNodes) {
      return true
    }

    // 计算右子树节点数，如果总数大于剩余节点数，则取右子树有可能
    const rightNodes = n - leftNodes - 1
    if (rightNodes > n - rightNodes) {
      return true
    }
  } else {
    // 计算以 x 开始的节点总数
    // 首先找到值为 x 的节点
    const node = findNode(root, x)
    if (node) {
      // 计算以其开始的节点总数
      const nums = numOfNodes(node)
      // 如果剩余节点数大于其开始的节点总数，则取其父节点有可能
      if (n - nums > nums) {
        return true
      }

      // 计算以其左节点开始的节点总数
      const leftNodes = numOfNodes(node.left)

      // 取其左节点有可能
      if (leftNodes > n - leftNodes) {
        return true
      }

      // 计算以其右节点开始的节点总数
      const rightNodes = numOfNodes(node.right)

      // 取其右节点有可能
      if (rightNodes > n - rightNodes) {
        return true
      }
    }
  }

  return false
}

// 找到值为 x 的节点
var findNode = function (root, x) {
  if (root) {

    if (root.val === x) {
      return root
    }

    const leftResult = findNode(root.left, x)

    if (leftResult) {
      return leftResult
    }

    const rightResult = findNode(root.right, x)

    if (rightResult) {
      return rightResult
    }
  }

  return null
}

// 以 node 节点开始的所有节点个数
var numOfNodes = function (node) {
  if (node) {
    return 1 + numOfNodes(node.left) + numOfNodes(node.right)
  }

  return 0
}

const root = new TreeNode(1)
const l1 = new TreeNode(2)
const r1 = new TreeNode(3)
root.left = l1
root.right = r1

// l1.left = new TreeNode(4)
// l1.right = new TreeNode(5)

r1.left = new TreeNode(6)
r1.right = new TreeNode(7)

console.log(btreeGameWinningMove(root, 5, 6))