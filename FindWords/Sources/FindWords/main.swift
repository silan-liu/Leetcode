// https://leetcode.com/problems/keyboard-row/description/
func findWords(_ words: [String]) -> [String] {
    var result = [String]()
    
    for word in words {
        if containsInOneRow(word) {
            result.append(word)
        }
    }
    
    return result
}

func containsInOneRow(_ word: String) -> Bool {
    let keyboard = ["0123456789", "qwertyuiop", "asdfghjkl", "zxcvbnm"]

    if word.count > 0 {
        // 根据第一个字符找到row
        let index = word.index(word.startIndex, offsetBy: 0)
        
        let char = word[index]
        let lowercased = Character(String(char).lowercased())
        for row in keyboard {
            if row.contains(lowercased) {
                
                for w in word {
                    let lowercased = Character(String(w).lowercased())

                    if !row.contains(lowercased) {
                        return false
                    }
                }
                
                return true
            }
        }
    }
    
    return false
}

print(findWords(["Hello", "Alaska", "Dad", "Peace"]))
