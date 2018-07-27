// https://leetcode.com/problems/missing-number/description/
func missingNumber(_ nums: [Int]) -> Int {
    let count = nums.count
    var map = [Int: Int]()
    
    for n in nums {
        map[n] = 1
    }
    
    for i in 0...count {
        let value = map[i]
        if value == nil {
            return i
        }
    }
    
    return 0
}

let nums = [9,6,4,2,3,5,7,0,1]
print(missingNumber(nums))
