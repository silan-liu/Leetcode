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

// faster
func pivotIndex_2(_ nums: [Int]) -> Int {
    var sum = 0
    
    var i = 0
    while i < nums.count {
        sum += nums[i]
        
        i += 1
    }
    
    i = 0
    while i < nums.count {
        var j = 0
        var leftSum = 0
        
        let diff = sum - nums[i]
        // 非偶数，跳过
        if diff % 2 != 0 {
            i += 1
            continue
        }
        
        let expectSum = diff / 2
        
        while j < i {
            leftSum += nums[j]
        
            j += 1
        }
        
        if leftSum == expectSum {
            return i
        }
        
        i += 1
    }
    
    return -1
}

let nums = [1,7,3,6,5,6]
print(pivotIndex(nums))
print(pivotIndex_2(nums))
