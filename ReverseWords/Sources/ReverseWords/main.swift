// https://leetcode.com/problems/reverse-words-in-a-string-iii/description/
func reverseWords(_ s: String) -> String {
    let words = s.split(separator: " ")
    var result = ""
    
    var i = 0
    while i < words.count {
        let index = words.index(words.startIndex, offsetBy: i)
        let word = words[index]
        let reversed = reverseWord(String(word))
        result.append(reversed)
        if i != words.count - 1 {
            result.append(" ")
        }
        
        i += 1
    }
    
    return result
}

func reverseWord(_ s: String) -> String {
    let len = s.count
    var i = len - 1
    var result = ""
    
    while i >= 0 {
        let index = s.index(s.startIndex, offsetBy: i)
        let c = s[index]
        
        result += String(c)
        
        i -= 1
    }
    
    return result
}

print(reverseWords("Let's take LeetCode contest"))
