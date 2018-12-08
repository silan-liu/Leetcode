// https://leetcode.com/problems/largest-number-at-least-twice-of-others/
func dominantIndex(_ nums: [Int]) -> Int {
    var max = Int.min
    var index = -1
    var i = 0
    
    while i < nums.count {
        let num = nums[i]
        if num > max {
            max = num
            index = i
        }
        i += 1
    }
    
    for num in nums {
        if max < 2 * num && max != num {
            return -1
        }
    }
    
    return index
}

let nums = [1, 2, 3, 8]
print(dominantIndex(nums))
