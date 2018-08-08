// https://leetcode.com/problems/maximum-product-of-three-numbers/description/
func maximumProduct(_ nums: [Int]) -> Int {
    if nums.count <= 2 {
        return 0
    }
    
    if nums.count == 3 {
        var result = 1
        for n in nums {
            result *= n
        }
        
        return result
    }
    
    var negNums = [Int]()
    var posNums = [Int]()
    
    for n in nums {
        if n < 0 {
            negNums.append(n)
        } else {
            posNums.append(n)
        }
    }
    
    // 全为负数
    if posNums.count == 0 {
        // 最大的三个数
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for n in negNums {
            if n > max1 {
                max3 = max2
                max2 = max1
                max1 = n
            } else if n > max2 {
                max3 = max2
                max2 = n
            } else if n > max3 {
                max3 = n
            }
        }
        
        return max1 * max2 * max3
    }
    
    var p1 = 1
    if negNums.count >= 2 {
        // 选出最小的2个数
        var min1 = Int.max
        var min2 = Int.max
        
        for n in negNums {
            if n < min1 {
                min2 = min1
                min1 = n
            } else if n < min2 {
                min2 = n
            }
        }
        
        p1 = min1 * min2
    }
    
    // 找出最大的三个数
    var max1 = Int.min
    var max2 = Int.min
    var max3 = Int.min
    
    var result = 0
    for n in posNums {
        if n > max1 {
            max3 = max2
            max2 = max1
            max1 = n
        } else if n > max2 {
            max3 = max2
            max2 = n
        } else if n > max3 {
            max3 = n
        }
    }
    
    // 三个正数的积
    if posNums.count >= 3 {
        result = max1 * max2 * max3
    }
    
    // 两个负数和一个正数的积
    if negNums.count >= 2 {
        let result1 = max1 * p1
        if result1 > result {
            result = result1
        }
    }
    
    return result
}

// 比1更简单，不用考虑负数和正数的情况
func maximumProduct_2(_ nums: [Int]) -> Int {
    if nums.count <= 2 {
        return 0
    }
    
    if nums.count == 3 {
        var result = 1
        for n in nums {
            result *= n
        }
        
        return result
    }
    
    // 找出最大的三个数
    var max1 = Int.min
    var max2 = Int.min
    var max3 = Int.min
    
    // 选出最小的2个数
    var min1 = Int.max
    var min2 = Int.max
    
    for n in nums {
        if n < min1 {
            min2 = min1
            min1 = n
        } else if n < min2 {
            min2 = n
        }
        
        if n > max1 {
            max3 = max2
            max2 = max1
            max1 = n
        } else if n > max2 {
            max3 = max2
            max2 = n
        } else if n > max3 {
            max3 = n
        }
    }
    
    return max(max1 * max2 * max3, min1 * min2 * max1)
}

let nums = [0,0,0,4]
print(maximumProduct(nums))
print(maximumProduct_2(nums))
