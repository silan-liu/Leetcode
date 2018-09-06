// https://leetcode.com/problems/remove-element/description/
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var i = nums.count - 1
    while i >= 0 {
        if nums[i] == val {
            nums.remove(at: i)
        }
        
        i -= 1
    }
    
    return nums.count
}

var nums = [3,2,2,3]
let val = 2
print(removeElement(&nums, val))
print(nums)
