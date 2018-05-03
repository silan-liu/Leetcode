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

      func description() {
          printTree(node: self)          
      }

      func printTree(node: TreeNode?) {
          if let node = node {
              print("\(node.val)")

              printTree(node: node.left)
              printTree(node: node.right)
          }
      }
}
 
class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {

        if t1 != nil || t2 != nil {
            var node: TreeNode? = nil

            if let t1 = t1, let t2 = t2 {
                node = TreeNode(t1.val + t2.val)
            } else if let t1 = t1 {
                node = TreeNode(t1.val)
            } else if let t2 = t2 {
                node = TreeNode(t2.val)
            }

            print("hello\(node?.val)")

            node?.left = mergeTrees(t1?.left, t2?.left)
            node?.right = mergeTrees(t1?.right, t2?.right)

            return node
        }

        return nil
    }
}


var t1 = TreeNode(1)
let t1_1 = TreeNode(2)
let t1_2 = TreeNode(3)

t1.left = t1_1
t1.right = t1_2

var t2 = TreeNode(2)
var t2_1 = TreeNode(4)
let t2_2 = TreeNode(4)

let t2_3 = TreeNode(5)
t2_1.left = t2_3

t2.left = t2_1
t2.right = t2_2

let solution = Solution()

let node = solution.mergeTrees(t1, t2)
node?.description()