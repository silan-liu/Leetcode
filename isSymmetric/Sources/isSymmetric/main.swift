// https://leetcode.com/problems/symmetric-tree/description/
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return recursive(root?.left, root?.right)
    }
    
    func recursive(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        } else if left == nil && right != nil {
            return false
        } else if left != nil && right == nil {
            return false
        } else if left?.val == right?.val {
            return recursive(left?.left, right?.right) && recursive(left?.right, right?.left)
        }
        
        return false
    }
}
