// https://leetcode.com/problems/maximum-subarray/description/
func maxSubArray(_ nums: [Int]) -> Int {
    var max = Int.min
    var sum = 0
    
    for num in nums {
        sum += num
        
        if sum > max {
            max = sum
        }
        
        if sum < 0 {
            sum = 0
        }
    }
    
    return max
}

let nums = [-2,-3,1,2]
print(maxSubArray(nums))
