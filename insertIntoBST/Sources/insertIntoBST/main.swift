// https://leetcode.com/problems/insert-into-a-binary-search-tree/submissions/
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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        } else  {
            if let root = root {
                if root.val < val {
                   root.right = insertIntoBST(root.right, val)
                } else {
                   root.left = insertIntoBST(root.left, val)
                }
            }

            return root
        }
    }
}

let s = Solution()
let root = TreeNode(3)
let left = TreeNode(2)
let right = TreeNode(5)

print(s.insertIntoBST(root, 10)?.val)