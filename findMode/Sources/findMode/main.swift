// https://leetcode.com/problems/find-mode-in-binary-search-tree/
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
    var map = [Int: Int]()
    
    func findMode(_ root: TreeNode?) -> [Int] {
        recursive(root)
      
        if map.count > 0 {
            // 从大到小排序
            let sortedMap = map.sorted(by: {$0.1 > $1.1})
            
            var result = [Int]()
            
            result.append(sortedMap[0].key)
            let maxCount = sortedMap[0].value
            
            var i = 1
            while i < sortedMap.count {
                if maxCount == sortedMap[i].value {
                    result.append(sortedMap[i].key)
                } else {
                    break
                }
                
                i += 1
            }
            
            return result
        } else {
            return []
        }
    }
    
    func recursive(_ root: TreeNode?) {
        if let root = root {
            if let value = map[root.val] {
                map[root.val] = value + 1
            } else {
                map[root.val] = 1
            }
            
            recursive(root.left)
            recursive(root.right)
        }
    }
}

let root = TreeNode(1)
let right = TreeNode(2)
let left = TreeNode(2)

root.right = right
right.left = left

let s = Solution()
print(s.findMode(root))
