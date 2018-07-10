// https://leetcode.com/problems/sum-of-left-leaves/description/
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


func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    var sum: Int = 0
    recursive(root, false, &sum)
    
    return sum
}

func recursive(_ root: TreeNode?, _ isLeft: Bool, _ sum: inout Int) {
    if let root = root {
        // 如果是叶子节点，并且是左子树
        if root.left == nil , root.right == nil, isLeft == true {
            sum += root.val
        } else {
            recursive(root.left, true, &sum)
            recursive(root.right, false, &sum)
        }
    }
}
 
