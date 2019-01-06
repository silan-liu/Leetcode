// https://leetcode.com/problems/implement-strstr/submissions/
func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.count == 0 {
        return 0
    }
    
    let haystackList = Array(haystack)
    let needleList = Array(needle)
    
    var i = 0
    while i <= haystackList.count - needleList.count {
        var j = 0
        var k = i
        var flag = true
        while j < needleList.count {
            if haystackList[k] == needleList[j] {
                k += 1
                j += 1
            } else {
                flag = false
                break
            }
        }
        
        if flag {
            return i
        }
        
        i += 1
    }
    
    return -1
}

let haystack = "a"
let needle = "a"
print(strStr(haystack, needle))
