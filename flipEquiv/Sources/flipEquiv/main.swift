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
 
 // https://leetcode.com/problems/flip-equivalent-binary-trees/submissions/
class Solution {
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if let root1 = root1, let root2 = root2, root1.val == root2.val {

            // 递归次数较多
            let result1 = flipEquiv(root1.left, root2.left) && flipEquiv(root1.right, root2.right)
            let result2 = flipEquiv(root1.left, root2.right) && flipEquiv(root1.right, root2.left)

            return result1 || result2

        } else if root1 == nil, root2 == nil {
            return true
        }

        return false
    }
}