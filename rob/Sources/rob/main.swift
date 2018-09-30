import Foundation
func rob(_ nums: [Int]) -> Int {
    var max = 0
    calcuteMax(0, nums, &max)
    return max
}

// 递归的方式耗时长
func calcuteMax(_ sum: Int, _ nums: [Int], _ max: inout Int
    ) {
    if nums.count == 0 {
        if max < sum {
            max = sum
        }
    } else {
        
        var i = 0
        while i < nums.count {
            let n = nums[i]
            
            let total = sum + n
            
            if (i + 2 < nums.count) {
                let sub = Array(nums[i+2..<nums.count])
                
                calcuteMax(total, sub, &max)
            } else {
                calcuteMax(total, [], &max)
            }
            
            i += 1
        }
    }
}

var max = 0
let nums = [183,219,57,193,94,233,202,154,65,240,97,234,100,249,186,66,90,238,168,128,177,235,50,81,185,165,217,207,88,80,112,78,135,62,228,247,211]

print(rob(nums))
