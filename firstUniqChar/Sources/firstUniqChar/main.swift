 // https://leetcode.com/problems/first-unique-character-in-a-string/description/
 func firstUniqChar(_ s: String) -> Int {
    var map = [Character: Int]()
    var posMap = [Character: Int]()
    
    // 记录位置，和个数
    var i = 0
    for c in s {
        if let value = map[c] {
            map[c] = value + 1
        } else {
            map[c] = 1
            posMap[c] = i
        }
        
        i += 1
    }
    
    // 过滤只出现一次的字符
    let filterResult = map.filter { (key, value) -> Bool in
        value == 1
    }
    
    if filterResult.count == 0 {
        return -1
    }
    
    // 找到index最小的字符
    var firstIndex = Int.max
    for (key, _) in filterResult {
        if let index = posMap[key] {
            if index < firstIndex {
                firstIndex = index
            }
        }
    }
    
    if firstIndex == Int.max {
        firstIndex = -1
    }
    
    return firstIndex
 }
 
 let s = "lldosoot"

 print(firstUniqChar(s))
