// https://leetcode.com/problems/duplicate-zeros/submissions/
class Solution {
    // 100%
    func duplicateZeros(_ arr: inout [Int]) {
        var i = arr.count - 1
        let count = arr.count
        while i >= 0 {
            if arr[i] == 0 {
                arr.insert(0, at: i)
            }
            
            i -= 1
        }
        
        // 删除超出原本 array 的部分。
        if arr.count > count {
            let range = Range.init(uncheckedBounds: (count, arr.count))
            
            arr.removeSubrange(range)
        }
       
        print(arr)
    }
}

let s = Solution()
var arr = [1,0,2,3,0,4,5,0]
s.duplicateZeros(&arr)
