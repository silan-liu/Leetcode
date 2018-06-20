// https://leetcode.com/problems/majority-element/description/
func majorityElement(_ nums: [Int]) -> Int {
    var map = [Int: Int]()
    var max = nums.count / 2
    var result = 0
    
    for num in nums {
        var count = 1
        if let value = map[num] {
            count = value + 1
        }
        
        map[num] = count
        
        if count >= max {
            max = count
            result = num
        }
    }
    
    return result
}

let nums = [2,2,1,1,1,2,2]
print(majorityElement(nums))
