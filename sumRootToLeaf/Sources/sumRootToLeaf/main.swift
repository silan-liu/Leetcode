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

// https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/
class Solution {
    // 10.42%
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        let totalArray = recursive(root)
        
        var sum = 0
        for list in totalArray {
            sum += calNum(list)
        }
        return sum
    }
    
    func calNum(_ list: [Int]) -> Int {
        var i = 0
        var num = 0
        while i < list.count {
            num = (num << 1) | list[i]
            i += 1
        }
        
        return num
    }
    
    func recursive(_ root: TreeNode?) -> [[Int]] {
        if let root = root {
            // 叶子节点
            if root.left == nil, root.right == nil {
                return [[root.val]]
            }
            
            let leftArray = recursive(root.left)
            let rightArray = recursive(root.right)
            
            // 拼起来
            var totalArray = [[Int]]()
            for sub in leftArray {
                let list = [root.val] + sub
                totalArray.append(list)
            }
            
            for sub in rightArray {
                let list = [root.val] + sub
                totalArray.append(list)
            }
            
            return totalArray
        }
        
        return []
    }
    
    // 98.18%
    func sumRootToLeaf2(_ root: TreeNode?) -> Int {
        let result = recursive2(root, 0)
        return result
    }
    
    // 每往下一层，只需要左移 1 位，然后或上当前的数
    func recursive2(_ root: TreeNode?, _ cur: Int) -> Int {
        if let root = root {
            let num = cur << 1 | root.val
            if root.left == nil, root.right == nil {
                return num
            }
            
            return recursive2(root.left, num) + recursive2(root.right, num)
        }
        
        return 0
    }
}

let s = Solution()
let root = TreeNode(1)

let left = TreeNode(0)
left.left = TreeNode(0)
left.right = TreeNode(1)

let right = TreeNode(1)
right.left = TreeNode(0)
right.right = TreeNode(1)

root.left = left
root.right = right

print(s.sumRootToLeaf(root))
print(s.sumRootToLeaf2(root))
