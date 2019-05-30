// https://leetcode.com/problems/increasing-order-search-tree/submissions/
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
    var list = [Int]()
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        // 先序遍历后，就是有序数组
        preorder(root)
        
        var rootNode: TreeNode? = nil
        
        if list.count > 0 {
            var node: TreeNode? = nil
            for value in list {
                if rootNode == nil {
                    rootNode = TreeNode(value)
                    node = rootNode
                } else {
                    let tmp = TreeNode(value)
                    node?.right = tmp
                    node = tmp
                }
            }
        }
        
        return rootNode
    }
    
    func preorder(_ root: TreeNode?) {
        if let root = root {
            if root.left != nil {
                preorder(root.left)
            }
            
            list.append(root.val)
            
            if root.right != nil {
                preorder(root.right)
            }
        }
    }
}

let root = TreeNode(5)
let left = TreeNode(4)
left.left = TreeNode(3)
let right = TreeNode(6)
right.right = TreeNode(7)

root.left =  left
root.right = right

let s = Solution()

let node = s.increasingBST(root);
print(s.increasingBST(root))
