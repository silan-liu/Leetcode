// https://leetcode.com/problems/same-tree/description/
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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    
    if let p = p, let q = q, p.val == q.val {
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    } else {
        return false
    }
}

