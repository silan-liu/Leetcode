// 3,4,2,3
// https://leetcode.com/problems/non-decreasing-array/submissions/
func checkPossibility(_ nums: [Int]) -> Bool {
    
    if nums.count <= 2 {
        return true
    }
    
    var i = 0
    var pre = Int.min
    var count = 0

    while i + 1 < nums.count {
        if nums[i] <= nums[i + 1] {
            pre = nums[i]
            i += 1
        } else {
            // 下降
            count += 1
            if count >= 2 {
                return false
            }

            if nums[i + 1] >= pre {
                i += 1
            } else {
                if i + 2 < nums.count {
                    // 上升
                    if nums[i + 2] >= nums[i] {
                        i += 1
                    } else {
                        // 下降
                        return false
                    }
                } else {
                    i += 1
                }
            }
        }
    }

    return true
}

let nums = [1,2,4,5,3]
print(checkPossibility(nums))