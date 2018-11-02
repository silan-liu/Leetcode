// time limited
// https://leetcode.com/problems/kth-largest-element-in-a-stream/
class KthLargest {
    let k: Int
    var nums: [Int]
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
        
        self.nums.sort()
        
        print(self.nums)
    }
    
    func add(_ val: Int) -> Int {
        var i = 0
        var flag = false
        while i < self.nums.count {
            if nums[i] >= val {
                flag = true
                nums.insert(val, at: i)
                break
            }
            i += 1
        }
        
        if (!flag) {
            nums.append(val)
        }
        
        let index = nums.count - k
        if index >= 0 && index < nums.count {
            return nums[index]
        }
        
        return -1
    }
}


class KthLargest_2 {
    let k: Int
    var nums: [Int]
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
    }
    
    func add(_ val: Int) -> Int {
        nums.append(val)
        let result = recursive(0, nums.count - 1, k, &nums)
        return result
    }
    
    func recursive(_ p: Int, _ q: Int, _ k: Int, _ a: inout [Int]) -> Int {
        if p > q {
            return -1
        }
        
        let index = pivot(p, q, &a)
        if index == a.count - k {
            return a[index]
        } else if index < a.count - k {
            return recursive(p + 1, q, k, &a)
        } else {
            return recursive(p, q - 1, k, &a)
        }
    }
    
    func pivot(_ p: Int, _ q: Int, _ nums: inout [Int]) -> Int {
        if p == q {
            return p
        }
        
        if p < q, q < nums.count {
            let value = nums[q]
            var i = p
            var j = p
            
            // 遍历到比value小的，进行交换
            while j < q {
                if nums[j] < value {
                    // swap
                    let tmp = nums[i]
                    nums[i] = nums[j]
                    nums[j] = tmp
                    
                    i += 1
                }
                
                j += 1
            }
            
            // 最后交换i，q的值
            nums[q] = nums[i]
            nums[i] = value
            
            print(nums)
            return i
        }
        
        return -1
    }
    
}
let obj = KthLargest_2(3, [4,5,8,2])
print(obj.add(3))
print(obj.add(5))
print(obj.add(10))
print(obj.add(9))
print(obj.add(4))
