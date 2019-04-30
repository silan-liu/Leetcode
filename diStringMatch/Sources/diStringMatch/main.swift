
// https://leetcode.com/problems/di-string-match/
class Solution {
    // 60%
    func diStringMatch(_ S: String) -> [Int] {
        var countOfI = 0
        var countOfD = 0
        
        var result = [Int]()
        let n = S.count
        
        for s in S {
            // <
            if s == "I" {
                countOfI += 1
                
                result.append(countOfI - 1)
                
            } else if s == "D" {
                // >
                countOfD += 1
                
                result.append(n + 1 - countOfD)
            }
        }
        
        result.append(countOfI)
        
        return result
    }
}

let s = Solution()
let S = "DDI"
print(s.diStringMatch(S))
