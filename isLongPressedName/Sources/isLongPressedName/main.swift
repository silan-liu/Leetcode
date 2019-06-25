// https://leetcode.com/problems/long-pressed-name/
class Solution {
    // 95.00%
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var i = 0
        var j = 0
        
        let nameList = Array(name)
        let typedList = Array(typed)
        
        // 分别遍历计算出 name, typed 相同的字符，进行比较，如果相同且typed中的字符数>name的，则继续。
        // alex, aaleex
        while i < nameList.count {

            if j < typedList.count, nameList[i] == typedList[j] {
                var c1 = 1
                
                // 在 nameList 中找相同的字符
                while i + 1 < nameList.count, nameList[i] == nameList[i+1] {
                    i += 1
                    c1 += 1
                }
                
                var c2 = 1
                // 在 typedList 中找相同的字符
                while j + 1 < typedList.count, typedList[j] == typedList[j+1] {
                    j += 1
                    c2 += 1
                }
                
                // 字符数较少，不符合
                if c2 < c1 {
                    return false
                } else {
                    // 继续遍历
                    i += 1
                    j += 1
                }
            } else {
                return false
            }
        }
        
        // 如果 j 还未匹配完，肯定不符合
        if j < typedList.count {
            return false
        }
        
        return true
    }
    
    // 双指针
    func isLongPressedName2(_ name: String, _ typed: String) -> Bool {
        let nameList = Array(name)
        let typedList = Array(typed)
        
        let m = nameList.count
        var i = 0
        var j = 0
        
        while j < typedList.count {
            // 相等，继续遍历，不相等时，判断 typepList 与前一个字符是否相等
            if i < m, nameList[i] == typedList[j] {
                i += 1
            } else if j == 0 || typedList[j] != typedList[j - 1] {
                return false
            }
            
            j += 1
        }
        
        return i == m
    }
}

let s = Solution()
let name = "laiden", typed = "laiden"

print(s.isLongPressedName(name, typed))
print(s.isLongPressedName2(name, typed))


