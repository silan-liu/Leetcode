// https://leetcode.com/problems/degree-of-an-array/description/
func findShortestSubArray(_ nums: [Int]) -> Int {
    // 记录num的个数
    var map = [Int: Int]()
    
    //  记录num开始/结束的索引: [num: (startIndex, endIndex)]
    var positionMap = [Int: (Int, Int)]()
    
    var i = 0
    for num in nums {
        if let value = map[num] {
            map[num] = value + 1
        } else {
            map[num] = 1
        }
        
        //  记录num开始/结束的索引
        if let value = positionMap[num] {
            // 再次出现，更新endIndex
            positionMap[num] = (value.0, i)
        } else {
            // 第一次出现
            positionMap[num] = (i, i)
        }
        
        i += 1
    }
    
    var maxDegree = 0
    // 找到最大的degree
    for (_, value) in map {
        if value > maxDegree {
            maxDegree = value
        }
    }
    
    var minLen = Int.max
    
    // 遍历所有的与maxDegree相同的值
    for (key, value) in map {
        if value == maxDegree {
            // 找到其对应的index元组
            if let value = positionMap[key] {
                let len = value.1 - value.0 + 1
                
                if len < minLen {
                    minLen = len
                }
            }
        }
    }
    
    return minLen
}

let nums = [1,2,2,3,3,3,2]
print(findShortestSubArray(nums))
