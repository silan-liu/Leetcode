
// https://leetcode.com/problems/backspace-string-compare/description/
func backspaceCompare(_ S: String, _ T: String) -> Bool {
    let s = deleteChar(S)
    let t = deleteChar(T)
    
    return s == t
}

func deleteChar(_ S: String) -> String {
    var s = S
    var i = 0
    
    while i >= 0 && i < s.count {
        let index = s.index(s.startIndex, offsetBy: i)
        
        let char = s[index]
        if char == "#" {
            // 删除前一位
            if i - 1 >= 0 {
                let lastIndex = s.index(s.startIndex, offsetBy: i - 1)
                
                s.removeSubrange(lastIndex...index)
                i -= 1
            } else {
                s.remove(at: index)
            }
            continue
        }

        i += 1
    }
    
    print("after delete:\(s)")
    return s
}

let S = "ab#c", T = "ad#c"
print(backspaceCompare(S, T))
