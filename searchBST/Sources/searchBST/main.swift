// https://leetcode.com/problems/search-in-a-binary-search-tree/description/
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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if let root = root {
            if root.val == val {
                return root
            }
            
            if root.val < val {
                return searchBST(root.right, val)
            }
            
            return searchBST(root.left, val)
        }
        
        return nil
    }
}

let root = TreeNode(5)
root.left = TreeNode(4)
root.right = TreeNode(6)

let s = Solution()
let node = s.searchBST(root, 2)
print(node?.val)
