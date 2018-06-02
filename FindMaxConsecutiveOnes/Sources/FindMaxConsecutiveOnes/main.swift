
// https://leetcode.com/problems/max-consecutive-ones/description/
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var max = 0
    var count = 0
    
    for num in nums {
        if num == 1 {
            count += 1
        } else {
            if count > max {
                max = count
            }
            
            count = 0
        }
    }
    
    // 如果1是最后一位，需再次判断max
    if count > max {
        max = count
    }
    
    return max
}

let nums = [1,1,1,0,1,1,1,1]
print(findMaxConsecutiveOnes(nums))
