import Foundation
// https://leetcode.com/problems/house-robber/description/
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

// f0 = a[0], f1 = a[1]
// result = max(f0 + a[i], f1)
func rob_2(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    else if nums.count == 1 {
        return nums[0]
    } else if nums.count == 2 {
        let a = nums[0]
        let b = nums[1]
        let value = a > b ? a : b
        return value
    } else {
        var f0: Int = nums[0]
        var f1: Int = nums[0] > nums[1] ? nums[0] : nums[1]
        
        var result = f1
        
        var i = 2
        while i < nums.count {
            let v1 = f0 + nums[i]
            let v2 = f1
            result = v1 > v2 ? v1 : v2
            
            f0 = f1
            f1 = result
            
            i += 1
        }
        
        return result
    }
}

var max = 0
let nums = [183,219,57,193,94,233,202,154,65,240,97,234,100,249,186,66,90,238,168,128,177,235,50,81,185,165,217,207,88,80,112,78,135,62,228,247,211]

let num1 = [2,1,1,2]
//print(rob(nums))
print(rob_2(num1))
