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
    // 这种方式重复次数太多
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


class Solution_2 {
    var maxCount = 0
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        countOfSameValue(root)
        return maxCount
    }
    
    // 求经过root节点的最长路径，左子树路径+右子树路径
    func countOfSameValue(_ root: TreeNode?) ->  Int {
        if let root = root {
            // 左子树相同值最大长度
            let left = countOfSameValue(root.left)
            
            // 右子树相同值最大长度
            let right = countOfSameValue(root.right)

            var leftLen = 0
            var rightLen = 0

            // 如果左子树的值和当前值相等，则需要加上左子树路径
            if root.left?.val == root.val {
                leftLen += 1 + left
            }

            // 如果右子树的值和当前值相等，则需要加上右子树路径
            if root.right?.val == root.val {
                rightLen += 1 + right
            }

            // 计算最大值
            maxCount = max(maxCount, leftLen + rightLen)
            return max(leftLen, rightLen)
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

let obj1 = Solution_2()
print(obj1.longestUnivaluePath(root))
