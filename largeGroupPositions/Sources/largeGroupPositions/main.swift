// https://leetcode.com/problems/positions-of-large-groups/description/
func largeGroupPositions(_ S: String) -> [[Int]] {
    if S.count > 0 {
        var result = [[Int]]()
        
        var pre = S.first!
        var count = 1
        
        var i = 1
        var start = 0
        while i < S.count {
            let index = S.index(S.startIndex, offsetBy: i)
            if S[index] == pre {
                count += 1
            } else {
                // large group
                if count >= 3 {
                    let range = [start, i - 1]
                    result.append(range)
                }
                
                pre = S[index]
                start = i
                count = 1
            }
            
            i += 1
        }
        
        // 如果large group在最后，aaa
        if count >= 3 {
            let range = [start, i - 1]
            result.append(range)
        }
        
        return result
    }
    
    return []
}

let S = "aaa"
print(largeGroupPositions(S))
