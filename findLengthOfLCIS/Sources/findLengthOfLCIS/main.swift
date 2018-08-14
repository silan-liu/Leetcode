// https://leetcode.com/problems/longest-continuous-increasing-subsequence/description/
func findLengthOfLCIS(_ nums: [Int]) -> Int {
    if nums.count > 0 {
        var last = nums[0]
        var i = 1
        var maxLength = 1
        var len = 1
        while i < nums.count {
            if nums[i] > last {
                len += 1
                
                if maxLength < len {
                    maxLength = len
                }
            } else {
                len = 1
            }
            
            last = nums[i]
            i += 1
        }
        
        return maxLength
    }
    
    return nums.count
 }
 
 let nums = [2,2,2]
 print(findLengthOfLCIS(nums))
