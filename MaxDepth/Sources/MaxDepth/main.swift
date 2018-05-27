
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
    if let _ = root {
        return calMaxDepth(root, level: 1)
    }
 
    return 0
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

func maxDepth_2(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    return max(maxDepth_2(root?.left), maxDepth_2(root?.right)) + 1
}
