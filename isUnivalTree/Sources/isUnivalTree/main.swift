
// https://leetcode.com/problems/univalued-binary-tree/submissions/
// Definition for a binary tree node.
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
    // 100%
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        // 非递归方式
        var queue = [TreeNode]()
        var value = 0
        if let root = root {
            queue.append(root)
            value = root.val
        } else {
            return false
        }
        
        
        while queue.count > 0 {
            // 取出值
            let node = queue[0]
            queue.removeFirst()
            
            if node.val != value {
                return false
            }
            
            if node.left != nil {
                queue.append(node.left!)
            }
            
            if node.right != nil {
                queue.append(node.right!)
            }
        }
     
        return true
    }
    
    // 递归方式 100 %
    func isUnivalTree_2(_ root: TreeNode?) -> Bool {
        if let root = root {
            return recursive(root, root.val)
        }
        
        return false
    }
    
    func recursive(_ root: TreeNode?, _ val: Int) -> Bool {
        if let root = root {
            if root.val == val {
                return recursive(root.left, val) && recursive(root.right, val)
            } else {
                return false
            }
        }
        
        return true
    }
}

let root = TreeNode(2)
root.left = TreeNode(1)
root.right = TreeNode(2)

let s = Solution()
print(s.isUnivalTree(root))
print(s.isUnivalTree_2(root))
