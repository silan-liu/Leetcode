// https://leetcode.com/problems/set-mismatch/
func findErrorNums(_ nums: [Int]) -> [Int] {
    var map = [Int: Int]()
    var sum = 0
    var realSum = 0
    var result = [Int]()
    
    var i = 1
    while i <= nums.count {
        sum += i
        
        i += 1
    }
    
    for num in nums {
        if let value = map[num] {
            map[num] = value + 1
        } else {
            map[num] = 1
        }
        
        realSum += num
    }
    
    // duplication num
    var duplicatedNum = 0
    for (key, value) in map {
        if value == 2 {
            duplicatedNum = key
            break
        }
    }
    
    result.append(duplicatedNum)
    
    let diff = sum - realSum
    let missNum = duplicatedNum + diff
    
    result.append(missNum)
    
    return result
}

func findErrorNums_2(_ nums: [Int]) -> [Int] {
    var sum = 0
    var realSum = 0
    var setSum = 0
    var result = [Int]()
    var set = Set<Int>()
    
    var i = 1
    while i <= nums.count {
        sum += i
        
        i += 1
    }
    
    for num in nums {
        set.insert(num)
        
        realSum += num
    }
    
    for num in set {
        setSum += num
    }
    
    let duplicatedNum = realSum - setSum
    let missNum = sum - setSum
    
    result.append(duplicatedNum)
    result.append(missNum)
    
    return result
}

func findErrorNums_3(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    var tmp = nums
    for num in tmp {
        if tmp[num - 1] < 0 {
            // duplicated num
            result.append(num)
        } else {
            tmp[num - 1] = -num
        }
    }
    
    // missnum所在的位置肯定是被重复的数给占了
    // 重复的数>0，所有只需要判断tmp[i]>0，missNum = i+1
    var i = 0
    while i < tmp.count {
        if tmp[i] > 0 {
            result.append(i + 1)
        }
        
        i += 1
    }
    
    return result
}

let nums = [1,2,5,4,4]
print(findErrorNums(nums))
print(findErrorNums_2(nums))
print(findErrorNums_3(nums))
