
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
    func tree2str(_ t: TreeNode?) -> String {
        var result = ""

        recursive(t, &result)
        return result
    }
    
    func recursive(_ t: TreeNode?, _ result: inout String) {
        if let t = t {
            result.append(String(t.val))
            
            if t.left != nil || t.right != nil {
                
                if t.left == nil {
                    result.append("()")
                } else {
                    result.append("(")
                    recursive(t.left, &result)
                    result.append(")")
                }
                
                if t.right != nil {
                    result.append("(")
                    recursive(t.right, &result)
                    result.append(")")
                }
            }
        }
    }
}
