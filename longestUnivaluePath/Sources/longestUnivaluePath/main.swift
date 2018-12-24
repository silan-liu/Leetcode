// https://leetcode.com/problems/longest-univalue-path/submissions/
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
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        if let root = root {
            let count = countOfSameValue(root, root.val)

            return max(count, longestUnivaluePath(root.left), longestUnivaluePath(root.right))
        }

        return 0
    }
    
    // 求经过root节点的最长路径，左子树路径+右子树路径
    func countOfSameValue(_ root: TreeNode?, _ value: Int) ->  Int {
        if let root = root {
            let leftCount = maxCountOfSameValue(root.left, value)
            let rightCount = maxCountOfSameValue(root.right, value)

            return leftCount + rightCount
        }
 
        return 0
    }

    // 求左右子树中值相等的最大路径长度
    func maxCountOfSameValue(_ root: TreeNode?, _ value: Int) -> Int {
        if let root = root {
            if root.val == value {
                return 1 + max(maxCountOfSameValue(root.left, value), maxCountOfSameValue(root.right, value))
            }
        }

        return 0
    }
}

let root = TreeNode(5)
let node1 = TreeNode(2)
let node2 = TreeNode(2)
let node3 = TreeNode(5)
let node4 = TreeNode(5)

node1.left = node2
root.left = node1

node3.right = node4
root.right = node3

let obj = Solution()
print(obj.longestUnivaluePath(root))
print(obj.countOfSameValue(root, 5))
