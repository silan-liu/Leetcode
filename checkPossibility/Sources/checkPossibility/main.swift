// 3,4,2,3
// https://leetcode.com/problems/non-decreasing-array/submissions/
// 分2种情况
// [-1,4,2,3]，去掉高点，当下降时a[i] > a[i+1]，如果a[i+1] >= pre，则表示上升趋势，可去除i，继续遍历
// [1,3,5,2,6]，去掉低点，如果a[i+1] > pre，表示下降趋势，则去除i+1，那么要求a[i+2]>a[i]，才能保持上升
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

            // 可抛掉i
            if nums[i + 1] >= pre {
                i += 1
            } else {
                if i + 2 < nums.count {
                    // 上升
                    // 可抛掉i+1
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