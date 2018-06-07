
// https://leetcode.com/problems/move-zeroes/description/
func moveZeroes(_ nums: inout [Int]) {
    var i = 0
    var end = nums.count
    while i < end {
        let num = nums[i]
        if num == 0 {
            // append
            nums.append(num)
            
            // remove
            nums.remove(at: i)
            
            end = end - 1
        } else {
            i += 1
        }
    }
}

var nums = [0,0,0,0,0]
moveZeroes(&nums)
print(nums)
