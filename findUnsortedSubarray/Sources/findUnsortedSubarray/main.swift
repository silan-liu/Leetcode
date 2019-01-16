// https://leetcode.com/problems/shortest-unsorted-continuous-subarray/submissions/
class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let sortedArray = nums.sorted()
        var i = 0
        var j = nums.count - 1

        var find_start = false
        var find_end = false
        var start = 0
        var end = 0

        while i <= j {
            if sortedArray[i] != nums[i] {
                start = i
                find_start = true
            } else {
                i += 1
            }

            if sortedArray[j] != nums[j] {
                end = j
                find_end = true
            } else {
                j -= 1
            }

            if find_start && find_end {
                return end - start + 1
            }
        }

        return 0
    }
}

let s = Solution()
let nums = [7,8,9,2,3,4,10]
print(s.findUnsortedSubarray(nums))

