// https://leetcode.com/problems/balanced-binary-tree/
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
 

func isBalanced(_ root: TreeNode?) -> Bool {
    if let root = root {
        if root.left == nil && root.right == nil {
            return true
        }
        
        let leftHeight = height(root.left)
        let rightHeight = height(root.right)
        if abs(leftHeight - rightHeight) > 1 {
            return false
        }
        
        return isBalanced(root.left) && isBalanced(root.right)
    }
    
    return true
}

func height(_ root: TreeNode?) -> Int {
    if let root = root {
        return 1 + max(height(root.left), height(root.right))
    } else {
        return 0
    }
}

let root = TreeNode(3)
let left = TreeNode(9)
let right = TreeNode(20)
root.left = left
root.right = right

right.left = TreeNode(15)
right.right = TreeNode(7)

print(isBalanced(root))
