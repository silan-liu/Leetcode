// https://leetcode.com/problems/remove-duplicates-from-sorted-array/
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count >= 1 {
        var lastIndex = 0
        var lastNum = nums[0]
        var count = 1
        
        var i = 1
        while i < nums.count {
            let num = nums[i]
            if num == lastNum {
                count += 1
                
                // 如果是最后一个，需要判断是否覆盖
                if i == nums.count - 1 {
                    if count > 1 {
                        lastIndex += 1
                        nums[lastIndex] = num
                        count = 1
                    }
                }
            } else {
                // 有重复的数，将不同的数覆盖到对应的位置
                if count > 1 {
                    lastIndex += 1
                    nums[lastIndex] = num
                    count = 1
                } else {
                    // 无重复，更新要覆盖的值
                    lastIndex = i
                }
                
                lastNum = num
            }
            
            i += 1
        }
        
        return lastIndex + 1
    }
    
    return 0
}

var nums = [0]
print(removeDuplicates(&nums))
print(nums)
