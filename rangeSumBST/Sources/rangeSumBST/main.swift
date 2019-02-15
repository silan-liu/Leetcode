// https://leetcode.com/problems/range-sum-of-bst/submissions/
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
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        if let root = root {
            if root.val >= L && root.val <= R {
                return root.val + rangeSumBST(root.left, L, R) + rangeSumBST(root.right, L, R)
            } else if root.val < L {
                return rangeSumBST(root.right, L, R)
            } else if root.val > R {
                return rangeSumBST(root.left, L, R)
            }
        }

        return 0
    }
}

let root = TreeNode(10)
let n1 = TreeNode(8)
let n2 = TreeNode(11)
root.left = n1
root.right = n2

let s = Solution()
print(s.rangeSumBST(root, 0, 1))

