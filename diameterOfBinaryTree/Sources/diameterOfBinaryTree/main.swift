// https://leetcode.com/problems/diameter-of-binary-tree/description/
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        // 递归计算每个节点的diameter，取最大值
        if let root = root {
            let diameter = diameterOfNode(root)
            
            let leftDiameter = diameterOfBinaryTree(root.left)
            let rightDiameter = diameterOfBinaryTree(root.right)
            
            return max(diameter, leftDiameter, rightDiameter)
        } else {
            return 0
        }
    }
    
    func diameterOfNode(_ root: TreeNode?) -> Int {
        let leftLevel = levelOfLeaf(root?.left)
        let rightLevel = levelOfLeaf(root?.right)
        
        let diameter = leftLevel + rightLevel
        
        return diameter
    }

    // 找根节点左右两边最长的
    func levelOfLeaf(_ root: TreeNode?) -> Int {
        if let root = root {
            return 1 + max(levelOfLeaf(root.left), levelOfLeaf(root.right))
        }
        
        return 0
    }
    
    // 方法2，只需遍历一次
    func diameterOfBinaryTree_2(_ root: TreeNode?) -> Int {
        var maxDiameter = 0
        level(root, &maxDiameter)
        return maxDiameter
    }
    
    @discardableResult func level(_ root: TreeNode?, _ maxDiameter: inout Int) -> Int {
        if let root = root {
            let leftLevel = level(root.left, &maxDiameter)
            let rightLevel = level(root.right, &maxDiameter)
            
            print("node:\(root.val), leftLevel:\(leftLevel), rightLevel:\(rightLevel)")
            
            // 记录最大值
            maxDiameter = max(maxDiameter, leftLevel + rightLevel)
            return 1 + max(leftLevel, rightLevel)
        }
        
        return 0
    }
}

let s = Solution()

let root = TreeNode(1)
let left = TreeNode(2)
left.left = TreeNode(4)
left.right = TreeNode(5)
let right = TreeNode(3)

root.left = left
root.right = right

let d = s.diameterOfBinaryTree_2(root)
print(d)
