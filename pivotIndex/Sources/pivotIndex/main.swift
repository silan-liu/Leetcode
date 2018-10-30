// https://leetcode.com/problems/find-pivot-index/
func pivotIndex(_ nums: [Int]) -> Int {
    var i = 0
    while i < nums.count {
        // left sum
        var j = 0
        var leftSum = 0
        while j < i {
            leftSum += nums[j]
            j += 1
        }
        
        j = i + 1
        var rightSum = 0
        while j < nums.count {
            rightSum += nums[j]
            j += 1
        }
        
        if leftSum == rightSum {
            return i
        }
        
        i += 1
    }
    
    return -1
}

let nums = [1, 7, 3, 6, 5, 6, 6]
print(pivotIndex(nums))
