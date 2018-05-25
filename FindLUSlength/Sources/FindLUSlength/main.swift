import Foundation

// https://leetcode.com/problems/longest-uncommon-subsequence-i/description/
func findLUSlength(_ a: String, _ b: String) -> Int {
    let aLen = a.count
    let bLen = b.count
    
    var maxLen = -1
    
    var i = 0

    while i < aLen - 1 {
        
       var j = i + 1
        
        while j < aLen {
          
            let startIndex = a.index(a.startIndex, offsetBy: i)
            let endIndex = a.index(a.startIndex, offsetBy: j)
           
            let subString = a[startIndex...endIndex]
            
            if !b.contains(subString) {
                if subString.count > maxLen {
                    maxLen = subString.count
                }
            }

            j += 1
        }
        
        i += 1
    }
    
    i = 0
    while i < bLen - 1 {
        
        var j = i + 1
        
        while j < bLen {
            
            let startIndex = b.index(b.startIndex, offsetBy: i)
            let endIndex = b.index(b.startIndex, offsetBy: j)
            
            let subString = b[startIndex...endIndex]
            
            if !a.contains(subString) {
                if subString.count > maxLen {
                    maxLen = subString.count
                }
            }
            
            j += 1
        }
        
        i += 1
    }
    
    return maxLen
}

// a = "aa", b="aaa",结果为3。因为b不是a的子串，所以当a!=b时，只需判断a,b的最大长度。
func findLUSlength_2(_ a: String, _ b: String) -> Int {
    if a == b {
        return -1
    }
    
    return max(a.count, b.count)
}

print(findLUSlength_2("abaddfsd", "cdcfssdfsd"))
