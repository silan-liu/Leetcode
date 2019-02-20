
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

        let sortedNums = nums.sorted(by: { num1, num2 in
            return num1 > num2
        })

        var list = [TreeNode]()

        var i = 0
        let root: TreeNode = TreeNode(sortedNums[i])
        list.append(root)

        while i < sortedNums.count / 2 {
            // 取出一个node
            if let node = list.first {
                    // 移除第一个
                list.remove(at: 0)

                if 2 * i+1 < sortedNums.count {
                    let left = TreeNode(sortedNums[2 * i + 1])
                    node.left = left
                    list.append(left)
                }

                if 2 * i + 2 < sortedNums.count {
                    let right = TreeNode(sortedNums[2 * i + 2])
                    node.right = right
                    list.append(right)                    
                }                 
            }

            i += 1
        }

        return root
    }
}

let nums = [5, 4, 3]
let s = Solution()
if let root = s.constructMaximumBinaryTree(nums) {
    print(root.val)
}

