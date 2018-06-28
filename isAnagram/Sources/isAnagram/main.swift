import Foundation
// 相同字母，不同顺序
// 这种方式超时了
//https://leetcode.com/problems/valid-anagram/description/
func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var tmp = t
    for c in s {
        if tmp.contains(c) {
            if let index = tmp.index(of: c) {
                tmp.remove(at: index)
            }
        }
    }
    
    if tmp.count == 0 {
        return true
    }
    
    return false
}

func isAnagram2(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    if s == t {
        return true
    }
    
    let s1 = s.sorted()
    let t1 = t.sorted()
    
    if s1 == t1 {
        return true
    }
    
    return false
}

// 若为异构，两个字符串中，不同字符的个数肯定是相等的
func isAnagram3(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var map = [Character: Int]()
    
    // 计算不同字符的个数
    for c in s {
        var count = 1
        if let value = map[c] {
            count = value + 1
        }
        
        map[c] = count
    }
    
    for c in t {
        if var value = map[c] {
            // 减去对应的字符
            value -= 1
            
            // 如果个数<0,则个数不等
            if value < 0 {
                return false
            }
            
            map[c] = value

        } else {
            return false
        }
    }
    
    return true
}

let s = "rabta", t = "rtbaa"
print(isAnagram2(s, t))
