// https://leetcode.com/problems/rotate-array/submissions/
func rotate(_ nums: inout [Int], _ k: Int) {
    var i = 0
    while i < k {
        let last = nums.last!
        nums.insert(last, at: 0)
        nums.removeLast()

        i += 1
    }
}

var nums = [-1,-100,3,99]
let k = 2
rotate(&nums, k)

print(nums)
