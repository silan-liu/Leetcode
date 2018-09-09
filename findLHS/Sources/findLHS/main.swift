// https://leetcode.com/problems/longest-harmonious-subsequence/description/
func findLHS(_ nums: [Int]) -> Int {
    var map = [Int: Int]()
    
    for num in nums {
        if let value = map[num] {
            map[num] = value + 1
        } else {
            map[num] = 1
        }
    }
    
    let sortedKeys = map.keys.sorted()
    var i = 1
    var long = 0
    
    while i < sortedKeys.count {
        let key1 = sortedKeys[i - 1]
        let key2 = sortedKeys[i]
        if abs(key1 - key2) == 1 {
            let len = map[key1]! + map[key2]!
            if len > long {
                long = len
            }
        }
        
        i += 1
    }
    
    return long
}

let nums = [1,3,2,2,5,2,3,7]
print(findLHS(nums))

