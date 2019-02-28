
// https://leetcode.com/problems/all-possible-full-binary-trees/submissions/
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
        // 必须为奇数才满足。
        if N < 0 || N % 2 == 0 {
            return []
        }

        return recursive(N)
    }

    func recursive(_ N: Int) -> [TreeNode?] {
        var list = [TreeNode?]()
        if N == 1 {
            let node = TreeNode(0)
            list.append(node)
        } else {
            var i = 1
            // 比如N = 7，那么左右节点个数组合为(1,5),(3,3),(5,1)，然后再对子树的进行细分。
            while i < N {
                let leftList = allPossibleFBT(i)
                let rightList = allPossibleFBT(N - i - 1)

                for leftNode in leftList {
                    for rightNode in rightList {
                        // 节点组合
                        let node = TreeNode(0)
                        node.left = leftNode
                        node.right = rightNode

                        // 最终的根节点
                        list.append(node)
                    }
                }

                i += 2
            }
        }

        return list
    }
}