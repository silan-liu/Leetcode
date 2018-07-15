// https://leetcode.com/problems/relative-ranks/description/
func findRelativeRanks(_ nums: [Int]) -> [String] {
    // 记录排序后num对应的index，如果有相同的num，则需要用数组记录其index
    var sortedMap = [Int: [Int]]()
    
    var result = [String]()
    
    let sortedNums = nums.sorted { (num1, num2) -> Bool in
        return num1 > num2
    }
    

    var i = 0
    while i < sortedNums.count {
        let key = sortedNums[i]
        if var value = sortedMap[key] {
            value.append(i)
            sortedMap[key] = value
        } else {
            sortedMap[key] = [i]
        }
        i += 1
    }
    
    i = 0
    while i < nums.count {
        let num = nums[i]

        if var indexList = sortedMap[num] {
            if indexList.count >= 1 {
                let sortedIndex = indexList[0]
                if sortedIndex == 0 {
                    result.append("Gold Medal")
                } else if sortedIndex == 1 {
                    result.append("Silver Medal")
                } else if sortedIndex == 2 {
                    result.append("Bronze Medal")
                } else {
                    result.append(String(sortedIndex + 1))
                }
                
                indexList.remove(at: 0)
                sortedMap[num] = indexList
            }
        }
        
        i += 1
    }
    
    return result
}

// 这种方式在有相同的元素时，结果与第一种不一样
func findRelativeRanks_2(_ nums: [Int]) -> [String] {
    var sortedMap = [Int: Int]()
    
    var result = [String]()
    
    let sortedNums = nums.sorted { (num1, num2) -> Bool in
        return num1 > num2
    }
    
    var i = 0
    while i < sortedNums.count {
        sortedMap[sortedNums[i]] = i
        i += 1
    }
    
    i = 0
    while i < nums.count {
        let num = nums[i]
        
        if let sortedIndex = sortedMap[num] {
            if sortedIndex == 0 {
                result.append("Gold Medal")
            } else if sortedIndex == 1 {
                result.append("Silver Medal")
            } else if sortedIndex == 2 {
                result.append("Bronze Medal")
            } else {
                result.append(String(sortedIndex + 1))
            }
        }
        
        i += 1
    }
    
    return result
}

let nums = [1,1,1,4]

print(findRelativeRanks_2(nums))

