// https://leetcode.com/problems/range-sum-query-immutable/submissions/
class NumArray {
    
    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if i <= j, i >= 0, j < nums.count {
            var k = i
            var sum = 0
            while k <= j  {
                sum += nums[k]
                k += 1
            }
            
            return sum
        }
        
        return 0
    }
}

let nums = [-2, 0, 3, -5, 2, -1]
let obj = NumArray(nums)
print(obj.sumRange(0, 5))

