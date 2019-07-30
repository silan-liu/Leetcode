// https://leetcode.com/problems/binary-prefix-divisible-by-5/
class Solution {
    func prefixesDivBy5(_ A: [Int]) -> [Bool] {
        var result = [Bool]()
        
        var last = 0
        for a in A {
            let prefix = last << 1 | a
            print(prefix)
            result.append(prefix % 5 == 0)
            
            last = prefix
        }
        
        return result
    }
}

let s = Solution()
let A = [1,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,1,0]
print(s.prefixesDivBy5(A))
