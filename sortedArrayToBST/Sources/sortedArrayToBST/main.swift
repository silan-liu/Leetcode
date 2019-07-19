// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/discuss/
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

// 22.75%
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

// 100.00% 
// solution2
func sortedArrayToBST_2(_ nums: [Int]) -> TreeNode? {
    return recursiveTree(nums, 0, nums.count - 1)
}

func recursiveTree(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    if left > right {
        return nil
    }
    
    let mid = (left + right) / 2
    let midNum = nums[mid]
    
    let node = TreeNode(midNum)
    node.left = recursiveTree(nums, left, mid - 1)
    node.right = recursiveTree(nums, mid + 1, right)
    
    return node
}


let nums = [-10,-3,0,5,9]
let root = sortedArrayToBST(nums)
let root2 = sortedArrayToBST_2(nums)

print("end")
