// https://leetcode.com/problems/reverse-only-letters/submissions/
class Solution {
    // 90.20%
    func reverseOnlyLetters(_ S: String) -> String {
        var list = Array(S)
        var i = 0
        var j = list.count - 1
        
        while i <= j {
            while i < list.count, !list[i].isLetter {
                i += 1
            }
            
            while j >= 0, !list[j].isLetter {
                j -= 1
            }
            
            if i < j, i < list.count, j >= 0 {
                // swap
                let tmp = list[i]
                list[i] = list[j]
                list[j] = tmp
                
                i += 1
                j -= 1
            } else {
                break
            }
        }
        
        return String(list)
    }
}

let s = Solution()
let S = "ab-cd"
print(s.reverseOnlyLetters(S))
