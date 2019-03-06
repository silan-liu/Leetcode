// https://leetcode.com/problems/distribute-coins-in-binary-tree/
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
    var move = 0
    func distributeCoins(_ root: TreeNode?) -> Int {
        _ = dfs(root)
        return move
    }

    // 计算子节点给父节点的个数
    func dfs(_ root: TreeNode?) -> Int {
        if let root = root {
            let left = dfs(root.left)
            let right = dfs(root.right)

            move += abs(left) + abs(right)

            // 返回移动步数，自己要留1，所以root.val - 1。
            return root.val - 1 + left + right
        }

        return 0
    }
}