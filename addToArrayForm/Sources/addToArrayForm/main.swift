// https://leetcode.com/problems/add-to-array-form-of-integer/submissions/
class Solution {
    // 25%
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        if K == 0 {
            return A
        }
        
        // 把 K 转为数组
        var listK = [Int]()
        var tmp = K
        while tmp > 0 {
            let last = tmp % 10
            listK.insert(last, at: 0)
            tmp = tmp / 10
        }
        
        var result = [Int]()
        
        // 从后往前加
        var i = 0
        var c = 0
        while  A.count - 1 - i >= 0, listK.count - 1 - i >= 0 {
            let a = A[A.count - 1 - i]
            let k = listK[listK.count - 1 - i]
            
            let n = (a + k + c) % 10
            
            result.insert(n, at: 0)
            
            c = (a + k + c) / 10

            i += 1
        }
        
        while A.count - 1 - i >= 0 {
            let a = A[A.count - 1 - i]
            
            let n = (a + c) % 10
            result.insert(n, at: 0)
            
            c = (a + c) / 10

            i += 1
        }
        
        while listK.count - 1 - i >= 0 {
            let a = listK[listK.count - 1 - i]
            
            let n = (a + c) % 10
            result.insert(n, at: 0)
            
            c = (a + c) / 10

            i += 1
        }
        
        if c > 0 {
            result.insert(c, at: 0)
        }
        
        return result
    }
    
    // 14.58% 
    // 567 + 345,  c = 345
    // 1. 7 + 345 = 352, c = 35, 2
    // 2. 35 + 6 = 41, c = 4, 1
    // 3. 5 + 4 = 9, 9
    func addToArrayForm2(_ A: [Int], _ K: Int) -> [Int] {
        // 对 A 的每位加上 K
        var result = [Int]()
        var i = A.count - 1
        var c = K
        
        while i >= 0 {
            result.insert(((A[i] + c) % 10), at: 0)
            
            // 更新 c
            c = (A[i] + c) / 10
                
            i -= 1
        }
        
        while c > 0 {
            result.insert(c % 10, at: 0)
            c = c / 10
        }
        
        return result
    }
}

let s = Solution()
let A = [5,6,7], K = 2345
print(s.addToArrayForm(A, K))
print(s.addToArrayForm2(A, K))
