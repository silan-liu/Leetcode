// https://leetcode.com/problems/path-sum-iii/description/
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
    var num = 0
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        travel(root, sum)
        return num
    }
    
    // or
    func pathSum_1(_ root: TreeNode?, _ sum: Int) -> Int {
        if let root = root {
            recursive(root, sum, 0)
            pathSum_1(root.left, sum)
            pathSum_1(root.right, sum)
        }
        
        return num
    }
    
    func travel(_ root: TreeNode?, _ sum: Int) {
        if let root = root {
            recursive(root, sum, 0)
            travel(root.left, sum)
            travel(root.right, sum)
        }
    }
    
    func recursive(_ root: TreeNode?, _ sum: Int, _ curSum: Int) {
        if let root = root {

            let total = curSum + root.val
            if total == sum {
                num += 1
            }
            
            recursive(root.left, sum, total)
            recursive(root.right, sum, total)
        }
    }
}

let root = TreeNode(3)
let left = TreeNode(-2)
let right = TreeNode(1)

root.left = left
root.right = right

let l1 = TreeNode(2)
left.left = l1

l1.left = TreeNode(1)
l1.right = TreeNode(2)

let r2 = TreeNode(4)
let l2 = TreeNode(2)
l2.left = TreeNode(1)
r2.left = l2

let s = Solution()
//print(s.pathSum(root, 4))
print(s.pathSum_1(root, 4))
