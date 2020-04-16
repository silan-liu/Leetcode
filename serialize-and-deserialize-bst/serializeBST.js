// https://leetcode.com/problems/serialize-and-deserialize-bst/

// Definition for a binary tree node.
function TreeNode(val) {
  this.val = val;
  this.left = this.right = null;
}


/**
 * Encodes a tree to a single string.
 *
 * @param {TreeNode} root
 * @return {string}
 */
// 30.07%
var serialize = function (root) {
  if (root) {
    return `-${root.val}` + serialize(root.left) + serialize(root.right)
  }

  return ''
};

/**
 * Decodes your encoded data to tree.
 *
 * @param {string} data
 * @return {TreeNode}
 */
var deserialize = function (data) {
  let str = data
  if (str && str.length > 0) {
    // 去除首个 -，因为 split 后是空格
    if (str.startsWith('-')) {
      str = str.substring(1, str.length)
    }

    let array = str.split('-')
    console.log(array)
    if (array.length >= 1) {

      let root = new TreeNode(parseInt(array[0]))

      let i = 1
      while (i < array.length) {
        insertNode(root, parseInt(array[i]))
        i += 1
      }

      return root
    }
  }

  return null
};

var insertNode = function (root, val) {
  if (!root) {
    return
  }

  if (val < root.val) {
    if (!root.left) {
      root.left = new TreeNode(val)
    } else {
      insertNode(root.left, val)
    }
  } else {

    if (!root.right) {
      root.right = new TreeNode(val)
    } else {
      insertNode(root.right, val)
    }
  }
}

let root = new TreeNode(8)
let left = new TreeNode(5)
let right = new TreeNode(15)
root.left = left
root.right = right

left.left = new TreeNode(4)
left.right = new TreeNode(6)
right.left = new TreeNode(14)
right.right = new TreeNode(16)


console.log(deserialize(serialize(root)));
