// https://leetcode.com/problems/subtree-of-another-tree/description/
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
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
         var queue = [TreeNode]()
        
        if let s = s {
            queue.append(s)
            
            while queue.count > 0 {
                let node = queue[0]
                queue.removeFirst()
                let result = isSameTree(node, t)
                if result {
                    return true
                }
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            return false
        }
        
        return t == nil
    }
    
    func isSameTree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        
        if s != nil && t == nil {
            return false
        }
        
        if s == nil && t != nil {
            return false
        }
        
        if s != nil && t != nil {
            if s!.val == t!.val {
                return isSameTree(s!.left, t!.left) && isSameTree(s!.right, t!.right)
            }
            
            return false
        }
        
        return false
    }
}

let s = TreeNode(5)
let left = TreeNode(3)
let right = TreeNode(4)
s.left = left
s.right = right

let t = TreeNode(5)
let l1 = TreeNode(3)
let l2 = TreeNode(4)
t.left = l1
t.right = l2

let obj = Solution()
print(obj.isSubtree(s, t))
