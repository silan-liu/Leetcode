// https://leetcode.com/problems/leaf-similar-trees/description/
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
 
// 所有叶子节点从左至右组成的list相同
func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    let leaf1 = leafs(root1)
    let leaf2 = leafs(root2)
    
    return leaf1 == leaf2
}

func leafs(_ root: TreeNode?) -> [Int] {
    if let root = root {
        if root.left == nil && root.right == nil {
            return [root.val]
        } else {
            return leafs(root.left) + leafs(root.right)
        }
    }
    
    return []
}

let root1 = TreeNode(3)
let root2 = TreeNode(4)

let left = TreeNode(2)
let right = TreeNode(1)
root1.left = left
root1.right = right

root2.left = left


print(leafSimilar(nil, nil))
