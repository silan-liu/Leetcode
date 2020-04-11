
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

    // 如果左子树节点 > 剩余节点树，则取其左子树有可能
    if (leftNodes > n - leftNodes) {
      return true
    }

    const rightNodes = n - leftNodes - 1
    if (rightNodes > n - rightNodes) {
      return true
    }
  } else {
    // 计算以 x 开始的节点总数
    const node = findNode(root, x)
    if (node) {
      const nums = numOfNodes(node)
      if (n - nums > nums) {
        return true
      }

      // 计算 x.left 开始的节点总数
      const leftNodes = numOfNodes(node.left)
      if (leftNodes > n - leftNodes) {
        return true
      }

      const rightNodes = numOfNodes(node.right)
      if (rightNodes > n - rightNodes) {
        return true
      }
    }
  }

  return false
}

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