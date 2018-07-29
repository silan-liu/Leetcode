
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


func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count > 0 {
        let midIndex = nums.count / 2
        let midNum = nums[midIndex]
        let node = TreeNode(midNum)
        
        let leftNums = Array(nums[0..<midIndex])
        node.left = sortedArrayToBST(leftNums)
        
        let rightNums = Array(nums[midIndex+1..<nums.count])
        node.right = sortedArrayToBST(rightNums)
        
        return node
    }
    
    return nil
}


let nums = [-10]
let root = sortedArrayToBST(nums)
print(root)
