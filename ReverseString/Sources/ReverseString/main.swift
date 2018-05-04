
//https://leetcode.com/problems/reverse-string/description/
func reverseString(_ s: String) -> String {
    var result = ""
    for s in s.reversed() {
        result.append(s)
    }
    
    return result
}

print(reverseString("hello"))
