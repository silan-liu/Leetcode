// https://leetcode.com/problems/shortest-completing-word/submissions/
class Solution {
    // 60.00%
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        var result = ""
        
        for word in words {
            var map = [Character: Int]()
            for c in word {
                if let count = map[c] {
                    map[c] = count + 1
                } else {
                    map[c] = 1
                }
            }
            
            var flag = true
            for c in licensePlate {
                if c.isLetter {
                    let lowercase = Character(c.lowercased())
                    if let count = map[lowercase], count >= 1 {
                        map[lowercase] = count - 1
                    } else {
                        flag = false
                        break
                    }
                }
            }
            
            if flag {
                if result == "" {
                    result = word
                } else {
                    result = word.count < result.count ? word: result
                }
            }
        }
        
        return result
    }
}

let s = Solution()
let licensePlate = "1s3 456", words = ["looks", "pest", "stew", "show"]
print(s.shortestCompletingWord(licensePlate, words))
