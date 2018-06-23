 // https://leetcode.com/problems/convert-bst-to-greater-tree/description/
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

 func convertBST(_ root: TreeNode?) -> TreeNode? {
    return recursive(root, root)
 }
 
 func recursive(_ root: TreeNode?, _ curNode: TreeNode?) -> TreeNode? {
    if let curNode = curNode {
        let sum = sumOfGreaterNum(root, curNode.val)
        let node = TreeNode(sum)
        
        // left
        node.left = recursive(root, curNode.left)
        
        // right
        node.right = recursive(root, curNode.right)
        
        return node
    }
    
    return nil
 }
 
 func sumOfGreaterNum(_ root: TreeNode?, _ num: Int) -> Int {
    if let root = root {
        if root.val >= num {
            // 该节点+左子树大的值+右子树大的值
            return root.val + sumOfGreaterNum(root.left, num) + sumOfGreaterNum(root.right, num)
        } else if root.val < num {
            // 查找右子树
            return sumOfGreaterNum(root.right, num)
        }
    }
    
    return 0
 }
