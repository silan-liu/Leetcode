// https://leetcode.com/problems/long-pressed-name/
class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var i = 0
        var j = 0
        
        let nameList = Array(name)
        let typedList = Array(typed)
        
        while i < nameList.count {
            while j < typedList.count, typedList[j] == nameList[i] {
                j += 1
            }
            
            if j < typedList.count {
                i += 1
                if typedList[j] != nameList[i] {
                    return false
                }
            } else {
                if i != nameList.count - 1 {
                    return false
                } else {
                    i += 1
                }
            }
        }
        
        return true
    }
}

let s = Solution()
let name = "aab", typed = "aabb"

print(s.isLongPressedName(name, typed))

