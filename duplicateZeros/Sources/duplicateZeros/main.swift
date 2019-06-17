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
    
    // 20.00%
    func duplicateZeros2(_ arr: inout [Int]) {
        var i = arr.count - 1
        
        // 从后往前，遍历 0
        while i >= 0 {
            if arr[i] == 0 {
                // 后移 [i+1, arr.count-2]
                var k = arr.count - 2
                while k >= i + 1 {
                    arr[k + 1] = arr[k]
                    k -= 1
                }
                
                // 填上0
                arr[k + 1] = 0
            }
            i -= 1
        }
        
        print(arr)
    }
}

let s = Solution()
var arr1 = [1,2,3,8,9,0,8,7,0,9,0,0,89,0,9,0,9,0,0,0]
var arr2 = [1,2,3,8,9,0,8,7,0,9,0,0,89,0,9,0,9,0,0,0]

s.duplicateZeros(&arr1)
s.duplicateZeros2(&arr2)

