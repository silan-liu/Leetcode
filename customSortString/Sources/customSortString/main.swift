// https://leetcode.com/problems/custom-sort-string/submissions/
class Solution {
    func customSortString(_ S: String, _ T: String) -> String {
        // 记录字符的index
        var map = [Character: Int]()

        var i = 0
        while i < S.count {
            
            let index = S.index(S.startIndex, offsetBy: i)
            let char = S[index]
            
            map[char] = i
            
            i += 1
        }
        
        // 存在的字符
        var existCharList = [Character]()
        
        // 剩余的字符
        var leftCharList = [Character]()
        
        i = 0
        while i < T.count {
            
            let index = T.index(S.startIndex, offsetBy: i)
            let char = T[index]
            
            if let order = map[char] {
                // 找到合适的位置
                var j = existCharList.count - 1
                while j >= 0, map[existCharList[j]]! >= order {
                    j -= 1
                }
                
                existCharList.insert(char, at: j + 1)
                
            } else {
                leftCharList.append(char)
            }
            
            i += 1
        }
        
        let list = existCharList + leftCharList
        return String(list)
    }
}

let S = "dcba", T = "abcddc"
let s = Solution()
print(s.customSortString(S, T))
