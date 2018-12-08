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
            // 如果是叶子节点，则比较总和
            if root.left == nil && root.right == nil {
                return sum == result
            }
        
            var flag = false
            // 遍历左子树
            if root.left != nil {
                flag = flag || recursive(root.left, sum, result)
            }
            
            // 遍历右子树
            if root.right != nil {
                flag = flag || recursive(root.right, sum, result)
            }
            
            return flag
        } else {
            return false
        }
    }
    
    func hasPathSum_2(_ root: TreeNode?, _ sum: Int) -> Bool {
        if let root = root {
            // 使用减法，遍历完一个节点后，减去该值，如果遇到叶子节点，值刚好等于sum，则满足条件。
            if root.left == nil && root.right == nil {
                return root.val == sum
            }
            
            return hasPathSum_2(root.left, sum - root.val) || hasPathSum_2(root.right, sum - root.val)
        }
        
        return false
    }
}
