// https://leetcode.com/problems/binary-tree-paths/description/
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result = [[Int]]()
        recursiveVisit(root, [], &result)
        
        var path = [String]()
        
        for list in result {
            var i = 0
            var str = ""
            while i < list.count {
                if i != 0 {
                    str += "->"
                }
                
                str += String(list[i])
                
                i += 1
            }
            
            path.append(str)
        }
        
        return path
    }
    
    func recursiveVisit(_ root: TreeNode?, _ curPathList: [Int], _ result: inout [[Int]]) {
        if let root = root {
            var tmp = curPathList
            tmp.append(root.val)
            
            // leaf
            if root.left == nil && root.right == nil {
                result.append(tmp)
            } else {
                recursiveVisit(root.left, tmp, &result)
                recursiveVisit(root.right, tmp, &result)
            }
        }
    }
}

let s = Solution()
let root = TreeNode(4)
root.left = TreeNode(3)
root.right = TreeNode(2)

let result = s.binaryTreePaths(root)
print(result)
