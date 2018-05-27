
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

func maxDepth(_ root: TreeNode?) -> Int {
    var level = 0
    if let _ = root {
        level = 1
    }
    
    return calMaxDepth(root, level: level)
}

func calMaxDepth(_ node: TreeNode?, level: Int) -> Int {
    if let node = node {
        
        var left = level
        var right = level
        
        if node.left != nil {
            left = calMaxDepth(node.left, level: level + 1)
        }
        
        if node.right != nil {
            right = calMaxDepth(node.right, level: level + 1)
        }
        
        return max(left, right)
    }
    
    return level
}
