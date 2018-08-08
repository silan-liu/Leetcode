// https://leetcode.com/problems/reverse-string-ii/description/
func reverseStr(_ s: String, _ k: Int) -> String {
    if k == 0 {
        return s
    }
    
    let len = s.count
    
    // 按2k分组
    let step = 2 * k
    let n = len / step
    let mod = len % step
    
    var result = ""
    if n > 0 {
        var i = 0
        while i < n {
            let startIndex = s.index(s.startIndex, offsetBy: i * step)
            let endIndex = s.index(startIndex, offsetBy: step - 1)
            
            let subString = s[startIndex...endIndex]
            let reversed = reverse(String(subString), k)
            
            result += reversed
            
            i += 1
        }
    }
    
    if mod >= 1 {
        // left
        let startIndex = s.index(s.startIndex, offsetBy: n * step)
        let endIndex = s.index(startIndex, offsetBy: mod - 1)
        
        let subString = s[startIndex...endIndex]
        let reversed = reverse(String(subString), k)
        
        result += reversed
    }
  
    return result
}

func reverse(_ s: String, _ k: Int) -> String {
    let len = s.count
    if len > 0 {
        var result = ""
        var start = k - 1

        if len <= k {
            start = len - 1
        }
        
        var i = start
        
        while i >= 0 {
            let index = s.index(s.startIndex, offsetBy: i)
            result.append(s[index])
            
            i -= 1
        }
        
        i = start + 1
        while i < len {
            let index = s.index(s.startIndex, offsetBy: i)
            result.append(s[index])
            
            i += 1
        }
        
        return result
    }
    
    return s
    
}

let s = "abcd", k = 2
print(reverseStr(s, k))
