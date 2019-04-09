// https://leetcode.com/problems/find-all-duplicates-in-an-array/submissions/
class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var list = nums
        var result = [Int]()
        
        // 逐个遍历，将 num 所对应的 index 设置为负数。
        for num in list {
            let positiveNum = abs(num)
            if positiveNum >= 1 && positiveNum <= list.count {
                let n = list[positiveNum - 1]
                
                // 已经置为负数，说明有相同的数
                if n < 0 {
                    result.append(positiveNum)
                } else {
                    list[positiveNum - 1] = -n
                }
            }
        }
        
        return result
    }
}

let s = Solution()
let nums = [2,2]
print(s.findDuplicates(nums))
