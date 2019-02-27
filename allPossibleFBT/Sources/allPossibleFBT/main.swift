
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
    var list: [TreeNode?] = [TreeNode]()

    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        return []
    }

    func buildTree(_ N: inout Int, _ curNode: TreeNode?, _ root: inout TreeNode?) {
        if N == 0 {
            list.append(root)
        } else {
            if root == nil {
                // 生成root
                root = TreeNode(0)
                N -= 1

                if N >= 2 {
                    // 生成左右子树
                    root?.left = TreeNode(0)
                    root?.right = TreeNode(0)

                    N -= 2

                    // 左边有2个节点
                    buildTree(&N, root?.left, &root) 

                    // 右边有2个节点
                    buildTree(&N, root?.right, &root)
                }
            }
        }
    } 
}