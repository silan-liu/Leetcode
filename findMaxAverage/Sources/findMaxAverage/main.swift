// https://leetcode.com/problems/maximum-average-subarray-i/
func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    if nums.count == 0 || k <= 0 {
        return 0
    }
    
    var maxSum = Int.min
    var sum = 0
    var count = 0
    var i = 0
    var j = 0
    
    while i < nums.count {
        if count < k {
            sum += nums[i]
            count += 1
            i += 1
        } else if count == k {
            // 当计算了k个数后，减去第一个数，然后加上下一个数，即为新的k个数之和
            maxSum = max(maxSum, sum)
            sum -= nums[j]
            j += 1
            count -= 1
            
            if j + k > nums.count {
                break
            }
        }
    }
    
    // 如果是最后一个数，在count < k退出了循环，需要再比较一次大小
    maxSum = max(maxSum, sum)
    
    return Double(maxSum) / Double(k)
}

func findMaxAverage_2(_ nums: [Int], _ k: Int) -> Double {
    if nums.count == 0 || k <= 0 {
        return 0
    }
    
    var sum = 0
    var maxSum = Int.min
    
    // 先计算K个数的和
    var i = 0
    while i < k {
        sum += nums[i]
        i += 1
    }
    
    maxSum = max(maxSum, sum)

    // 从k开始
    i = k
    while i < nums.count {
        // 减去第一个数，加上当前数
        sum += nums[i]
        sum -= nums[i - k]
        
        maxSum = max(sum, maxSum)
        
        i += 1
    }
    
    return Double(maxSum) / Double(k)
}

let nums = [1,12,-5,-6,50,3,90], k = 4
print(findMaxAverage(nums, k))
print(findMaxAverage_2(nums, k))
