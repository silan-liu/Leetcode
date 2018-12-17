 // https://leetcode.com/problems/word-pattern/submissions/
 func wordPattern(_ pattern: String, _ str: String) -> Bool {
    let wordList = str.split(separator: " ")
    if pattern.count != wordList.count {
        return false
    }
    
    var i = 0
    var map = [Character: String]()
    // 记录已经被映射过的
    var set = Set<String>()
    
    while i < pattern.count {
        let index = pattern.index(pattern.startIndex, offsetBy: i)
        let key = pattern[index]
        let word = String(wordList[i])
        
        if let value = map[key] {
            if word != value {
                return false
            }
        } else {
            if set.contains(word) {
                return false
            }
            
            map[key] = word
            set.insert(word)
        }
        
        i += 1
    }
    
    return true
 }
 
 let pattern = "abba", str = "dog dog dog dog"
 print(wordPattern(pattern, str))
