// https://leetcode.com/problems/binary-prefix-divisible-by-5/
class Solution {
    // 16.00%
    func prefixesDivBy5(_ A: [Int]) -> [Bool] {
        var result = [Bool]()
        
        // 假设 last = 5 * f + r
        // 下一位 (2 * last + a) % 5 = (2r + a) % 5，等于(上个数/5的余数*2+a) % 5
        
        var last = 0
        for a in A {
            let prefix = last << 1 | a
            print(prefix)
            result.append(prefix % 5 == 0)
            
            // 防止溢出
            last = prefix % 5
        }
        
        return result
    }
}

let s = Solution()
let A = [1,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,1,0]
print(s.prefixesDivBy5(A))
