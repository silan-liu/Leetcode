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

// 用0-n之和减去nums之和，即为结果
func missingNumber_2(_ nums: [Int]) -> Int {
    let count = nums.count
    
    var sum = 0
    for i in 0...count {
        sum += i
    }
    
    for n in nums {
        sum -= n
    }
    
    return sum
}

let nums = [9,6,4,2,3,5,7,0,1]
print(missingNumber_2(nums))
