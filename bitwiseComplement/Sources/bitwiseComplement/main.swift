// https://leetcode.com/problems/complement-of-base-10-integer/submissions/
class Solution {
    // 8.47%
    func bitwiseComplement(_ N: Int) -> Int {
        // 对于每位取反
        var result = 0
        var count = 0
        var tmp = N
        while tmp != 0 {
            let bit = tmp & 1
            let complementBit = 1 - bit
            result |= (complementBit << count)
            
            tmp = tmp >> 1
            
            count += 1
        }
        
        return result
    }
}

let s = Solution()
let N = 10
print(s.bitwiseComplement(N))
