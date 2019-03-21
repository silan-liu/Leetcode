
// https://leetcode.com/problems/maximum-binary-tree-ii/submissions/
//  * Definition for a binary tree node.
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
    var list = [Int]()

    func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        // 先序遍历的顺序满足按规则构建的顺序
        preVisitTree(root)

        // 直接加在末尾
        list.append(val)

        return constructMaximumBinaryTree(list)
    }

    // 先序遍历
    func preVisitTree(_ root: TreeNode?) {
        if let root = root {
            preVisitTree(root.left)
            list.append(root.val)
            preVisitTree(root.right)
        }
    }

    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }

        let largestIndex = largestNumIndex(nums)
        let value = nums[largestIndex]
        let node = TreeNode(value)

        let leftArray = Array(nums[0..<largestIndex])
        let rightArray = Array(nums[largestIndex+1..<nums.count])

        node.left = constructMaximumBinaryTree(leftArray)
        node.right = constructMaximumBinaryTree(rightArray)

        return node
    }

    func largestNumIndex(_ nums:[Int]) -> Int {
        if nums.count == 0 {
            return -1
        }

        var max = Int.min
        var i = 0
        var index = 0
        while i < nums.count {
            if max < nums[i] {
                max = nums[i]
                index = i
            }
            i += 1
        }

        return index
    }

    // 另一种方式，用递归，因为value是直接加在Alist后面的，所以当它大于Alist-max，A的root为其左节点；当它小于AList-max，肯定是在root的右节点。
    // A[0],A[1]...A[i], A[i+1]...A[n-1]，从A[0]-A[i-1]为A[i]的左子树，A[i+1]...A[n-1]为A[i]的右子树。
    // value添加到A后面时，A[0],A[1]...A[i], A[i+1]...A[n-1],value; 当value>A[i]，A[0]...A[n-1]为value的左子树，当value<A[i]时，为A[i]的右子树。

    func insertIntoMaxTree2(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if let root = root {
            if val > root.val {
                let node = TreeNode(val)
                node.left = root
                return node
            } else {
                root.right = insertIntoMaxTree2(root.right, val)
                return root
            }
        }

        return nil
    }
}