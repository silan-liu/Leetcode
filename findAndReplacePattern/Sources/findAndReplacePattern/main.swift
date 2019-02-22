// https://leetcode.com/problems/find-and-replace-pattern/submissions/
class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        
        var result = [String]()
        for word in words {
            if isMatchPattern(word, pattern) {
                result.append(word)
            }
        }

        return result
    }

    // 一个字符对应一个字符，同一个字符不能被映射多次。
    // abb -> cdd yes
    // abb -> cda no
    func isMatchPattern(_ word: String, _ pattern: String) -> Bool {
        if word.count != pattern.count {
            return false
        }

        var map = [Character: Character]()
        var set = Set<Character>()
    
        var i = 0
        while i < word.count {
            let c = word[word.index(word.startIndex, offsetBy: i)]
            let p = pattern[pattern.index(pattern.startIndex, offsetBy: i)]

            if let value = map[c] {
                if value != p {
                    return false
                }
            } else {
                // 已经映射过p
                if set.contains(p) {
                    return false
                }

                map[c] = p
                set.insert(p)
            } 

            i += 1
        }

        return true
    }
}

let s = Solution()
let words = ["dvv","deq","mee","aqq","dkd","ccc"], pattern = "abc"
print(s.findAndReplacePattern(words, pattern))
