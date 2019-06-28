class Solution {
    // 32.47%
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var map = [Character: Int]()
        
        // 保存排序
        var i = 0
        for char in order {
            map[char] = i
            i += 1
        }
        
        i = 0
        while i < words.count - 1 {
            let word1 = Array(words[i])
            let word2 = Array(words[i+1])
            
            var j = 0
            var k = 0
            while j < word1.count {
                if k < word2.count {
                    // 如果已经大于
                    if map[word1[j]]! > map[word2[k]]! {
                        return false
                    } else if map[word1[j]]! < map[word2[k]]! {
                        // 已经小于
                        break
                    }
                } else {
                    // word1 更长，表示要大些
                    return false
                }
                
                j += 1
                k += 1
            }
            
            i += 1
        }
        
        return true
    }
}

let s = Solution()
let words = ["ab","app"], order = "abcdefghijklmnopqrstuvwxyz"
print(s.isAlienSorted(words, order))
