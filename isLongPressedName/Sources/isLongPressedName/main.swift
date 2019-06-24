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
                
                while i + 1 < nameList.count, nameList[i] == nameList[i+1] {
                    i += 1
                    c1 += 1
                }
                
                var c2 = 1
                while j + 1 < typedList.count, typedList[j] == typedList[j+1] {
                    j += 1
                    c2 += 1
                }
                
                if c2 < c1 {
                    return false
                } else {
                    i += 1
                    j += 1
                }
            } else {
                return false
            }
        }
        
        if j < typedList.count {
            return false
        }
        
        return true
    }
}

let s = Solution()
let name = "abbb", typed = "abb"

print(s.isLongPressedName(name, typed))

