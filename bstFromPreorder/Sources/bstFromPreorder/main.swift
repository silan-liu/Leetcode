
// https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/submissions/
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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.count > 0 {
            let first = preorder[0]
            var lessList = [Int]()
            var greaterList = [Int]()

            // 找到所有小于第一个元素的值, 找到所有大于第一个元素的值
            var i = 1
            while i < preorder.count {
                let num = preorder[i]
                if num < first {
                    lessList.append(num)
                } else {
                    greaterList.append(num)
                }

                i += 1
            }

            let node = TreeNode(first)
            node.left = bstFromPreorder(lessList)
            node.right = bstFromPreorder(greaterList)
            
            return node
        } else {
            return nil
        }
    }

    func printTreeNode(_ node: TreeNode?) {
        if let node = node {
            print(node.val)

            if node.left != nil || node.right != nil {
                printTreeNode(node.left)
                printTreeNode(node.right)
            }
            
        } else {
            print("null")
        }
    }
}

let s = Solution()
let preorder = [8,5,1,7,10,12]
let node = s.bstFromPreorder(preorder)

s.printTreeNode(node)