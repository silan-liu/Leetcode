// https://leetcode.com/problems/cousins-in-binary-tree/
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

// 89.39%
class Solution {
    var xLevel = 0
    var yLevel = 0
    var xParent: TreeNode? = nil
    var yParent: TreeNode? = nil
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
  
        recursive(root, x, y, 0)
        
        if xLevel == yLevel, let xParent = xParent, let yParent = yParent, xParent.val != yParent.val {
            return true
        }
        
        return false
    }
    
    func recursive(_ root: TreeNode?, _ x: Int, _ y: Int, _ level: Int) {
        if let root = root {
            if root.left?.val == x  {
                xParent = root
                xLevel = level
            }
            
            if root.left?.val == y  {
                yParent = root
                yLevel = level
            }
            
            if root.right?.val == x {
                xParent = root
                xLevel = level
            }
            
            if root.right?.val == y {
                yParent = root
                yLevel = level
            }
            
            recursive(root.left, x, y, level + 1)
            
            recursive(root.right, x, y, level + 1)
        }
    }
}

// 89.39%
class Solution2 {
    // BFS
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var queue = [TreeNode]()
        if let root = root {
            queue.append(root)
            
            while !queue.isEmpty {
                let count = queue.count
                
                // 遍历每个元素，此时它们已经是同一层，只需要判断其父节点是否相同
                var i = 0
                var xExist = false
                var yExist = false
                
                while i < count {
                    
                    let node = queue.first!
                    queue.removeFirst()
                    
                    if node.val == x {
                        xExist = true
                    }
                    
                    if node.val == y {
                        yExist = true
                    }
                    
                    // 如果父节点是一样的，false
                    if node.left?.val == x, node.right?.val == y {
                        return false
                    }
                    
                    if node.right?.val == x, node.left?.val == y {
                        return false
                    }
                    
                    if node.left != nil {
                        queue.append(node.left!)
                    }
                    
                    if node.right != nil {
                        queue.append(node.right!)
                    }
                    
                    i += 1
                }
                
                if xExist && yExist  {
                    return true
                }
            }
        }
        
        return false
    }
}

let s = Solution()
let s2 = Solution2()

let root = TreeNode(1)
let left = TreeNode(2)
let right = TreeNode(3)

left.left = TreeNode(4)
right.right = TreeNode(5)

root.left = left
root.right = right

print(s.isCousins(root, 5, 4))
print(s2.isCousins(root, 5, 4))
