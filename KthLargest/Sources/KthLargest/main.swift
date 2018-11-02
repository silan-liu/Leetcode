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



let obj = KthLargest(7, [4,5,8,2])
print(obj.add(3))
print(obj.add(5))
print(obj.add(10))
print(obj.add(9))
print(obj.add(4))
