// https://leetcode.com/problems/greatest-common-divisor-of-strings/
class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1.count < str2.count {
            return gcdOfStrings(str2, str1)
        }
        
        if !str1.starts(with: str2) {
            return ""
        }
        
        if str2 == "" {
            return str1
        }
        
        let startIndex = str1.index(str1.startIndex, offsetBy: str2.count)
        let endIndex = str1.endIndex
        let substring = String(str1[startIndex..<endIndex])

        return gcdOfStrings(substring, str2)
    }
}

let s = Solution()
let str1 = "ABCABC", str2 = "ABC"
print(s.gcdOfStrings(str1, str2))
