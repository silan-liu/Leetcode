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

class NumArray_2 {
    
    var sum: [Int]
    
    init(_ nums: [Int]) {
        sum = [Int]()
        var k = 0
        while k < nums.count {
            sum.append(0)
            k += 1
        }
        
        k = 0
        while k < nums.count {
            if k - 1 < 0 {
                sum[k] = nums[k]
            } else {
                sum[k] = sum[k - 1] + nums[k]
            }
            
            k += 1
        }
    }
    
    // 预先计算好。
    func sumRange(_ i: Int, _ j: Int) -> Int {
        
        if i <= j, i >= 0, j < nums.count {
            if i - 1 < 0 {
                return sum[j]
            }
            
            return sum[j] - sum[i - 1]
        }
        
        return 0
    }
}


let nums = [-2, 0, 3, -5, 2, -1]
let obj = NumArray(nums)
print(obj.sumRange(0, 5))

let obj2 = NumArray(nums)
print(obj2.sumRange(0, 5))

