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

// nice solution
func isBalanced_2(_ root: TreeNode?) -> Bool {
    if let root = root {
        return height_2(root) != -1
    }
    
    return true
}
// 在计算高度的过程中就进行比较
func height_2(_ root: TreeNode?) -> Int {
    if let root = root {
        let leftHeight = height_2(root.left)
        // 已经不平衡
        if leftHeight == -1 {
            return -1
        } else {
            let rightHeight = height_2(root.right)
            
            // 已经不平衡
            if rightHeight == -1 {
                return -1
            } else {
                // 不平衡
                if abs(leftHeight - rightHeight) <= 1 {
                    return 1 + max(leftHeight, rightHeight)
                }
                
                return -1
            }
        }
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
print(isBalanced_2(root))
