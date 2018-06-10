func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var position = [Int: Int]()
    var result = [Int]()
    
    var i = 0
    while i < nums.count {
        let num = nums[i]
        position[num] = i
        
        i += 1
    }
    
    i = 1
    while i <= nums.count {
        let value = position[i]
        if value == nil {
            result.append(i)
        }
        
        i += 1
    }
    
    return result
}

func findDisappearedNumbers_2(_ nums: inout [Int]) -> [Int] {
    var i = 0
    var result = [Int]()
    
    while i < nums.count {
        let num = abs(nums[i])
        let index = num - 1
        let value = nums[index]
        
        // 把出现过的数字作为index，将其值标记为负数，则值为正数的所对应的index，是没出现的数。
        nums[index] = value > 0 ? -value : value
        
        i += 1
    }
    
    i = 0
    while i < nums.count {
        if nums[i] > 0 {
            result.append(i + 1)
        }
        
        i += 1
    }
    
    return result
}

var nums = [4,3,2,7,8,2,3,1]
print(findDisappearedNumbers(nums))
print(findDisappearedNumbers_2(&nums))

