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
    
    func duplicateZeros3(_ arr: inout [Int]) {
        let n = arr.count
        var i = 0
        var j = 0
        
        // j 表示增加 0 后的数组总长度
        while i < n {
            if arr[i] == 0 {
                j += 1
            }
            
            i += 1
            j += 1
        }
        
        // 从后遍历
        i = n - 1
        while i >= 0 {
            
            // 如果 j 在原数组范围内，则赋值，相当于在 i 中跳过不满足条件的值
            j -= 1
            if j < n, j >= 0 {
                arr[j] = arr[i]
            }
            
            // 如果 = 0，再添加一个0
            if arr[i] == 0 {
                j -= 1
                if j < n, j >= 0 {
                    arr[j] = 0
                }
            }
            
            i -= 1
        }
        
        print(arr)
    }
}

let s = Solution()
var arr1 = [1,2,3,8,9,0,8,7,0,9,0,0,89,0,9,0,9,0,0,0]
var arr2 = [1,2,3,8,9,0,8,7,0,9,0,0,89,0,9,0,9,0,0,0]
var arr3 = [1,2,3,8,9,0,8,7,0,9,0,0,89,0,9,0,9,0,0,0]

s.duplicateZeros(&arr1)
s.duplicateZeros2(&arr2)
s.duplicateZeros3(&arr3)

