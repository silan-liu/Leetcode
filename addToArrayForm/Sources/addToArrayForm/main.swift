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
}

let s = Solution()
let A = [0], K = 999999
print(s.addToArrayForm(A, K))
