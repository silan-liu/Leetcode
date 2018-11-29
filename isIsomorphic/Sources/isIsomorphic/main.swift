// https://leetcode.com/problems/isomorphic-strings/submissions/
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    let sList = Array(s)
    let tList = Array(t)
    
    var map = [Character: Character]()
    var set = Set<Character>()
    var i = 0
    while i < sList.count {
        let sChar = sList[i]
        let tChar = tList[i]
        
        let sValue = map[sChar]
        
        // 如果不存在映射
        if sValue == nil {
            if set.contains(tChar) {
                return false
            }
            
            map[sChar] = tChar
            
            // 记录已被映射的字符
            set.insert(tChar)
        } else {
            // 存在映射，但不相等
            if sValue != tChar {
                return false
            }
        }
        
        i += 1
    }
    
    return true
}

let s = "paper", t = "title"
print(isIsomorphic(s, t))
