// https://leetcode.com/problems/monotonic-array
class Solution {
    // 46.63%
    func isMonotonic(_ A: [Int]) -> Bool {
        // 升序或者降序
        if A.count <= 1 {
            return true
        }
        
        // 0 未设置，1-降序，2-升序
        var flag = 0
        
        var i = 0
        while i < A.count - 1 {
            
            if A[i] > A[i+1] {
                // 如果之前是升序
                if flag == 2 {
                    return false
                }
                // 降序
                flag = 1
            } else if A[i] < A[i+1] {
                // 如果之前是降序
                if flag == 1 {
                    return false
                }
                
                // 升序
                flag = 2
            }
            
            i += 1
        }
        
        return true
    }
    
    // 46.63%
    func isMonotonic2(_ A: [Int]) -> Bool {
        var descreasing = true
        var increasing = true
        
        var i = 0
        while i < A.count - 1 {
            if A[i] > A[i+1] {
                increasing = false
            } else if A[i] < A[i+1] {
                descreasing = false
            }
            
            i += 1
        }
        
        return descreasing || increasing
    }
}

let s = Solution()
let A = [1,1,1]
print(s.isMonotonic(A))
