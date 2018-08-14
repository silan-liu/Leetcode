// https://leetcode.com/problems/binary-tree-level-order-traversal-ii/description/
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if let root = root {

            var queue = [TreeNode]()
            var levelQueue = [TreeNode]()
            levelQueue.append(root)
            
            var result = [[Int]]()
            
            while levelQueue.count != 0 {
                
                queue = levelQueue
                levelQueue.removeAll()
                
                var nodes = [Int]()

                while queue.count != 0 {
                    let node = queue[0]
                    nodes.append(node.val)
                    
                    if let left = node.left {
                        levelQueue.append(left)
                    }
                    
                    if let right = node.right {
                        levelQueue.append(right)
                    }
                    
                    queue.remove(at: 0)
                }
                
                result.insert(nodes, at: 0)
            }
            
            return result
        }
        
        return []
    }
}

let root = TreeNode(3)
let left = TreeNode(9)
let right = TreeNode(20)
right.left = TreeNode(15)
right.right = TreeNode(7)
root.left = left
root.right = right

let s = Solution()
print(s.levelOrderBottom(root))
