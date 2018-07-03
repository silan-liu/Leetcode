
// https://leetcode.com/problems/minimum-distance-between-bst-nodes/description/
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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var minDiff = Int.max
        recursive(root, &minDiff)
        
        return minDiff
    }
    
    // 递归求出最小diff
    func recursive(_ root: TreeNode?, _ minDiff: inout Int) {
        if let root = root {
            let diff = findNodeDiff(root)
            
            if diff < minDiff {
                minDiff = diff
            }
            
            recursive(root.left, &minDiff)
            recursive(root.right, &minDiff)
        }
    }
    
    func findNodeDiff(_ root: TreeNode?) -> Int {
        var min = Int.max

        if let root = root {
            // 找左子树，最右节点，则是左边最大的数，跟root最接近
            
            // 有左子树
            if var node = root.left {
                // 往右边找
                while node.right != nil {
                    node = node.right!
                }
                
                // 计算差值
                let diff = root.val - node.val
                if diff < min {
                    min = diff
                }
            }
            
            // 找右子树，最左节点，则是右边最小的数，跟root最接近
            if var node = root.right {
                // 往左边找
                while node.left != nil {
                    node = node.left!
                }
                
                // 计算差值
                let diff = node.val - root.val
                if diff < min {
                    min = diff
                }
            }
        }
        
        return min
    }
}

var root = TreeNode(4)
root.left = TreeNode(2)
root.right = TreeNode(5)

let s = Solution()
print(s.minDiffInBST(root))
