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


let nums = [1,12,-5,-6,50,3,90], k = 4
print(findMaxAverage(nums, k))
