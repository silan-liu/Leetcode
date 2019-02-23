
// https://leetcode.com/problems/binary-tree-pruning/submissions/
// Definition for a binary tree node.
public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}

class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        if let root = root {
            // 叶子节点0
            if root.val == 0, root.left == nil, root.right == nil {
                return nil
            }

            let left = pruneTree(root.left)
            let right = pruneTree(root.right)

            // 0,且左右子树都是0
            if root.val == 0, left == nil, right == nil {
                return nil
            }

            root.left = left
            root.right = right
            return root
        }

        return nil
    }
}