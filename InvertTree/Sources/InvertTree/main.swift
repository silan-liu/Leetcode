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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if let root = root {
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        
        let tmp = left
        root.left = right
        root.right = tmp
    }
    
    return root
}
