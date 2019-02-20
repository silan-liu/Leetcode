// https://leetcode.com/problems/maximum-binary-tree/submissions/
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
}

let nums = [5, 4, 3]
let s = Solution()
if let root = s.constructMaximumBinaryTree(nums) {
    print(root.val)
}

