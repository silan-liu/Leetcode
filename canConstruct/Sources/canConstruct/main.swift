// https://leetcode.com/problems/ransom-note/description/
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var tmp = magazine
    for r in ransomNote {
        if tmp.contains(r) {
            if let index = tmp.index(of: r) {
                tmp.remove(at: index)
            }
        } else {
            return false
        }
    }
    
    return true
}

print(canConstruct("aa", "aab"))
