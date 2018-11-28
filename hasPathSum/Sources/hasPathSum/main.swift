// https://leetcode.com/problems/path-sum/submissions/
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        let result = recursive(root, sum, 0)
        return result
    }
    
    func recursive(_ root: TreeNode?, _ sum: Int, _ total: Int) -> Bool {
        if let root = root {
            let result = total + root.val
            if root.left == nil && root.right == nil {
                return sum == result
            }
        
            var flag = false
            if root.left != nil {
                flag = flag || recursive(root.left, sum, result)
            }
            
            if root.right != nil {
                flag = flag || recursive(root.right, sum, result)
            }
            
            return flag
        } else {
            return false
        }
    }
}
