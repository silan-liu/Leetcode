// https://leetcode.com/problems/complement-of-base-10-integer/submissions/
class Solution {
    // 8.47%
    func bitwiseComplement(_ N: Int) -> Int {
        // 对于每位取反
        if (N == 0) {
            return 1
        }
        
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
    
    // 98.31%
    func bitwiseComplement2(_ N: Int) -> Int {
        if (N == 0) {
            return 1
        }
        
        var result = 1
        var tmp = N
        var count = 0
        
        while tmp != 0 {
            
            result |= (1 << count)
            
            tmp = tmp >> 1
            
            count += 1
        }
        
        return result - N
    }
    
    // 98.36%
    func bitwiseComplement3(_ N: Int) -> Int {
        if (N == 0) {
            return 1
        }
        
        var result = 0
        var tmp = N
        
        while tmp != 0 {
            
            result = (result << 1) | 1
            
            tmp = tmp >> 1
        }
        
        return result - N
    }
    
    func bitwiseComplement4(_ N: Int) -> Int {
        var S = 1
        while S < N {
            S = (S << 1) | 1
            // S = S * 2 + 1
        }
        
        return S - N
    }
}

let s = Solution()
let N = 1025455456465
print(s.bitwiseComplement(N))
print(s.bitwiseComplement2(N))
print(s.bitwiseComplement3(N))
print(s.bitwiseComplement4(N))
