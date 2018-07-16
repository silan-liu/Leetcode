// https://leetcode.com/problems/binary-tree-tilt/description/
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
    func findTilt(_ root: TreeNode?) -> Int {
        if let root = root {
            let tilt = absoluteDiff(root)
            
            return tilt + findTilt(root.left) + findTilt(root.right)
        }
        
        return 0
    }
    
    // 该节点+所有子树节点之和
    func sumOfNode(_ root: TreeNode?) -> Int {
        if let root = root {
            return root.val + sumOfNode(root.left) + sumOfNode(root.right)
        }
        
        return 0
    }
    
    // 该节点的所有左子树之和-右子树之和的绝对值
    func absoluteDiff(_ root: TreeNode?) -> Int {
        if let root = root {
            let leftSum = sumOfNode(root.left)
            let rightSum = sumOfNode(root.right)
            
            return abs(leftSum - rightSum)
        }
        
        return 0
    }
}

let root = TreeNode(3)
let left = TreeNode(2)
let right = TreeNode(1)

root.left = left
root.right = right

let solution = Solution()
print(solution.findTilt(root))
