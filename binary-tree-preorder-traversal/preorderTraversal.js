// Definition for a binary tree node.
function TreeNode(val, left, right) {
  this.val = val === undefined ? 0 : val;
  this.left = left === undefined ? null : left;
  this.right = right === undefined ? null : right;
}

/**
 * @param {TreeNode} root
 * @return {number[]}
 */
// https://leetcode.com/problems/binary-tree-preorder-traversal/
// 递归
// 10.73%
var preorderTraversal = function (root) {
  let result = [];
  preoderTraversalRecursive(root, result);

  return result;
};

var preoderTraversalRecursive = function (root, result) {
  if (root) {
    // 根节点
    result.push(root.val);

    // 左节点
    preoderTraversalRecursive(root.left, result);

    // 右节点
    preoderTraversalRecursive(root.right, result);
  }
};

// 19.18%
var preoderTraversalIterative = function (root) {
  let result = [];

  if (root) {
    let list = [];
    list.push(root);
    while (list.length > 0) {
      // 取第一个数据
      const node = list.shift();
      result.push(node.val);

      // 右节点进栈
      if (node.right) {
        list.unshift(node.right);
      }

      // 左节点进栈
      if (node.left) {
        list.unshift(node.left);
      }
    }
  }

  return result;
};

const n1 = new TreeNode(1);
const n2 = new TreeNode(2);
const n3 = new TreeNode(3);
const n4 = new TreeNode(4);
const n5 = new TreeNode(5);
const n6 = new TreeNode(6);

n1.left = n2;
n1.right = n3;
n2.left = n4;
n2.right = n5;
n5.left = n6;

console.log(preorderTraversal(n1));
console.log(preoderTraversalIterative(n1));
