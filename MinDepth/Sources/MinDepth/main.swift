// https://leetcode.com/problems/minimum-depth-of-binary-tree/submissions/
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
    func minDepth(_ root: TreeNode?) -> Int {
        if let root = root {
            
            var level = 1
            if root.left != nil, root.right != nil {
                level += min(minDepth(root.left), minDepth(root.right))
            } else if root.right != nil {
                level += minDepth(root.right)
            } else if root.left != nil {
                level += minDepth(root.left)
            }
            
            return level
        }
        
        return 0
    }
}
